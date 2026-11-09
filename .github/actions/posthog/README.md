# posthog

Send analytics information about the run of a reusable workflow to Posthog.
Uses https://github.com/PostHog/posthog-github-action under the hood, and enhances the events with more data points about the reusable workflow called.

## Usage

Add the following as the last step in a reusable workflow job.
If your reusable workflow consists of multiple jobs, you should only invoke the action in one of the jobs.

### Inputs

- `api_key`: The public token for your Posthog project (starts with phc_)
- `workflow_inputs`: The workflow inputs cannot be found automatically, so you need to specify them by setting this to `${{ toJSON(inputs) }}`
- `extra_properties`: Attach custom data to events. Must be a JSON object, serialized to a string.

```yaml

jobs:
  foo:
    steps:
      ... # other steps
      - uses: entur/gha-meta/.github/actions/posthog@v1
        if: always()
        with:
          api_key:         x # The public token for your Posthog project (starts with phc_)
          workflow_inputs: ${{ toJSON(inputs) }}
          extra_properties: "{\"foo\": \"bar\"}"
```

## Event structure

All events are sent with the event name `workflow_executed`. The base properties declared here: https://github.com/PostHog/posthog-github-action#automatically-included-properties are included, in addition to:

- `calling_workflow_sha`: The value of `job.workflow_sha` from the GitHub context
- `calling_workflow_repository`: The value of `job.workflow_repository` from the GitHub context
- `calling_workflow_ref`: The value of `job.workflow_ref` from the Github context
- `calling_workflow_file_path`: The value of `job.workflow_file_path` from the Github context
- `calling_workflow_name`: The name of the reusable workflow. If `job.workflow_file_path` is `.github/workflows/foo.yml`, it will have the value `foo`.
- `calling_workflow_version`: The declared version of the reusable workflow: If `job.workflow_ref` is `foo-org/bar-repo/.github/workflow/baz.yml@refs/tags/v1` it will have the value `refs/tags/v1`.
- `calling_workflow_input_*`: The values of all the reusable workflow inputs as provided by the `workflow_inputs` argument to this action.
- `extra_*`: Custom data from the input `extra_properties`

Properties are prefixed with `calling_` to distinguish them from properties relating to the "base" workflow,
meaning the workflow that calls your reusable workflow.

<details>
<summary>View example event properties</summary>

```json
{
  "eventName": "pull_request",
  "workflow": "CI",
  "sha": "74be2ed858f078e8b708b26e642502b17b8d1704",
  "runId": 42649367767,
  "runNumber": 751,
  "actor": "***",
  "actor_type": "human",
  "ref": "refs/pull/335/merge",
  "repositoryOwner": "entur",
  "repository": "api-spec-registry",
  "calling_workflow_name": "validate",
  "calling_workflow_file_path": ".github/workflows/validate.yml",
  "calling_workflow_repository": "entur/gha-api",
  "calling_workflow_ref": "entur/gha-api/.github/workflows/validate.yml@refs/tags/v6",
  "calling_workflow_sha": "2f845da409fb346b02bf844ad778cf3bd0f2f2b3",
  "calling_workflow_version": "refs/tags/v6",
  "calling_workflow_input_show_changes": "all",
  "calling_workflow_input_changelog_dir": "",
  "calling_workflow_input_path": "specs/api-spec-registry/openapi.yaml",
  "calling_workflow_input_fail_on_breaking_changes": true,
  "calling_workflow_input_artifact": "",
  "calling_workflow_input_env": "prd",
  "extra_foo": "bar"
}
```

</details>