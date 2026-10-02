#!/usr/bin/env bash
# Validates the `tag-versions` step of .github/workflows/release.yml against
# local bare Git repositories, without touching GitHub.
#
# It extracts the step's `run:` block verbatim with `yq` and executes that
# exact script, so there is no second copy of the tagging logic to drift out
# of sync with what actually ships in the workflow.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
WORKFLOW_FILE="$REPO_ROOT/.github/workflows/release.yml"
WORK_ROOT="$(mktemp -d)"
trap 'rm -rf "$WORK_ROOT"' EXIT

SCRIPT_FILE="$WORK_ROOT/tag-versions.sh"
yq -r '.jobs.release-please.steps[] | select(.id == "tag-versions") | .run' "$WORKFLOW_FILE" > "$SCRIPT_FILE"

pass_count=0
fail_count=0

ok() {
  echo "  ok   - $1"
  pass_count=$((pass_count + 1))
}

fail() {
  echo "  FAIL - $1"
  fail_count=$((fail_count + 1))
}

assert_eq() {
  local actual="$1" expected="$2" msg="$3"
  if [[ "$actual" == "$expected" ]]; then
    ok "$msg"
  else
    fail "$msg (expected ${expected:-<empty>}, got ${actual:-<empty>})"
  fi
}

# Dereferences an (annotated) tag to the commit it points at, or prints
# nothing if the tag doesn't exist.
remote_tag_commit() {
  local remote="$1" tag="$2"
  git -C "$remote" rev-parse -q --verify "refs/tags/$tag^{commit}" 2>/dev/null || true
}

# Builds a bare "remote" with two commits on main; prints "<sha1> <sha2>".
new_remote_with_history() {
  local remote="$1" seed="$2"
  git init -q --bare "$remote"
  git init -q "$seed"
  git -C "$seed" config user.email test@example.com
  git -C "$seed" config user.name test
  echo one > "$seed/file.txt"
  git -C "$seed" add file.txt
  git -C "$seed" commit -q -m "feat: first"
  local sha1 sha2
  sha1="$(git -C "$seed" rev-parse HEAD)"
  echo two >> "$seed/file.txt"
  git -C "$seed" add file.txt
  git -C "$seed" commit -q -m "feat: second"
  sha2="$(git -C "$seed" rev-parse HEAD)"
  git -C "$seed" remote add origin "$remote"
  git -C "$seed" push -q origin HEAD:refs/heads/main
  echo "$sha1 $sha2"
}

# Simulates actions/checkout: a fresh, shallow (depth=1) checkout of exactly
# one commit, with no ancestors and no tags available locally.
shallow_checkout() {
  local remote="$1" dir="$2" sha="$3"
  git init -q "$dir"
  git -C "$dir" remote add origin "$remote"
  git -C "$dir" fetch -q --no-tags --depth=1 origin "$sha"
  git -C "$dir" checkout -q FETCH_HEAD
}

run_script() {
  local dir="$1" major="$2" minor="$3" sha="$4"
  (cd "$dir" && RELEASE_MAJOR="$major" RELEASE_MINOR="$minor" RELEASE_SHA="$sha" bash "$SCRIPT_FILE")
}

echo "=== scenario: missing floating tags (first release) ==="
{
  remote="$WORK_ROOT/s1/remote.git"
  seed="$WORK_ROOT/s1/seed"
  read -r c1 c2 <<< "$(new_remote_with_history "$remote" "$seed")"
  checkout="$WORK_ROOT/s1/checkout"
  shallow_checkout "$remote" "$checkout" "$c2"

  if run_script "$checkout" 1 0 "$c2"; then
    ok "script exits 0 when v1/v1.0 do not exist yet"
  else
    fail "script failed on first-ever release"
  fi

  assert_eq "$(remote_tag_commit "$remote" v1)" "$c2" "v1 created pointing at the release commit"
  assert_eq "$(remote_tag_commit "$remote" v1.0)" "$c2" "v1.0 created pointing at the release commit"
}

echo "=== scenario: existing floating tags move to the new release ==="
{
  remote="$WORK_ROOT/s2/remote.git"
  seed="$WORK_ROOT/s2/seed"
  read -r c1 c2 <<< "$(new_remote_with_history "$remote" "$seed")"

  # Prior release already moved the floating tags to c1, and the full
  # version tag for that prior release also lives on c1.
  git -C "$seed" tag -a v2 -m x "$c1"
  git -C "$seed" tag -a v2.1 -m x "$c1"
  git -C "$seed" tag -a v2.1.6 -m x "$c1"
  git -C "$seed" push -q origin refs/tags/v2 refs/tags/v2.1 refs/tags/v2.1.6

  checkout="$WORK_ROOT/s2/checkout"
  shallow_checkout "$remote" "$checkout" "$c2"

  if run_script "$checkout" 2 1 "$c2"; then
    ok "script exits 0 when moving existing floating tags"
  else
    fail "script failed moving existing floating tags"
  fi

  assert_eq "$(remote_tag_commit "$remote" v2)" "$c2" "v2 moved to the new release commit"
  assert_eq "$(remote_tag_commit "$remote" v2.1)" "$c2" "v2.1 moved to the new release commit"
  assert_eq "$(remote_tag_commit "$remote" v2.1.6)" "$c1" "full version tag v2.1.6 was never touched"
}

echo "=== scenario: checkout HEAD differs from the release commit ==="
{
  remote="$WORK_ROOT/s3/remote.git"
  seed="$WORK_ROOT/s3/seed"
  read -r c1 c2 <<< "$(new_remote_with_history "$remote" "$seed")"

  # The runner's shallow checkout only has c1 (e.g. the job started before
  # release-please created c2, or target_branch points elsewhere); c2 is
  # not present locally at all.
  checkout="$WORK_ROOT/s3/checkout"
  shallow_checkout "$remote" "$checkout" "$c1"
  if git -C "$checkout" cat-file -e "$c2" 2>/dev/null; then
    fail "test setup invalid: c2 should not be reachable from the shallow checkout"
  fi

  if run_script "$checkout" 3 0 "$c2"; then
    ok "script exits 0 and fetches the release commit when HEAD differs"
  else
    fail "script failed when checkout HEAD differed from the release commit"
  fi

  assert_eq "$(remote_tag_commit "$remote" v3)" "$c2" "v3 points at the release commit, not checkout HEAD"
  assert_eq "$(remote_tag_commit "$remote" v3.0)" "$c2" "v3.0 points at the release commit, not checkout HEAD"
}

echo "=== scenario: remote rejects one tag update; both tags stay unchanged ==="
{
  remote="$WORK_ROOT/s4/remote.git"
  seed="$WORK_ROOT/s4/seed"
  read -r c1 c2 <<< "$(new_remote_with_history "$remote" "$seed")"

  git -C "$seed" tag -a v2 -m x "$c1"
  git -C "$seed" tag -a v2.1 -m x "$c1"
  git -C "$seed" push -q origin refs/tags/v2 refs/tags/v2.1

  # Simulate the observed GitHub behaviour: one of the two floating tag
  # refs is rejected server-side (ruleset, protection, or otherwise) while
  # the other would individually be accepted.
  cat > "$remote/hooks/pre-receive" <<'HOOK'
#!/usr/bin/env bash
while read -r old new refname; do
  if [[ "$refname" == "refs/tags/v2.1" ]]; then
    echo "remote rejected (simulated): $refname" >&2
    exit 1
  fi
done
exit 0
HOOK
  chmod +x "$remote/hooks/pre-receive"

  checkout="$WORK_ROOT/s4/checkout"
  shallow_checkout "$remote" "$checkout" "$c2"

  if run_script "$checkout" 2 1 "$c2"; then
    fail "script exited 0 despite the remote rejecting the push"
  else
    ok "script's exit code surfaces the rejected push (no silent success)"
  fi

  assert_eq "$(remote_tag_commit "$remote" v2)" "$c1" "v2 unchanged on the remote after the rejection"
  assert_eq "$(remote_tag_commit "$remote" v2.1)" "$c1" "v2.1 unchanged on the remote after the rejection"
}

echo
echo "=== summary: $pass_count passed, $fail_count failed ==="
[[ "$fail_count" -eq 0 ]]
