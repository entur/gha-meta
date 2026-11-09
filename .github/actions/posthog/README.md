# posthog

Send analytics information about the run of a reusable workflow to Posthog.
Uses https://github.com/PostHog/posthog-github-action under the hood, and enhances the events with more data points about the reusable workflow called.

## Usage
Add the following as the last step in a reusable workflow job.
If your reusable workflow consists of multiple jobs, you should only invoke the action in one of the jobs.

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

Properties are prefixed with `calling_` to distinguish them from properties relating to the "base" workflow,
meaning the workflow that calls your reusable workflow.