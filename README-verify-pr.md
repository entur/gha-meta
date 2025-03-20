# Verify PR

Verify that pull request titles follows conventional commits spec

<https://www.conventionalcommits.org/en/v1.0.0/>

## Example

```yaml
name: verify pr
on:
  pull_request:

jobs:
  release:
    uses: entur/gha-meta/.github/workflows/verify-pr.yml@v1
```

## Inputs

<!-- AUTO-DOC-INPUT:START - Do not remove or modify this section -->
No inputs.
<!-- AUTO-DOC-INPUT:END -->

## Outputs

<!-- AUTO-DOC-OUTPUT:START - Do not remove or modify this section -->
No outputs.
<!-- AUTO-DOC-OUTPUT:END -->
