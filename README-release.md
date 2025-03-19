# release

Use release-please to create releases based on [conventional commit](https://www.conventionalcommits.org/en/v1.0.0/) messages.

This workflow will also push git tags for the major and minor versions, this enables you to pin at the wanted level `@v2`, `@v2.1`, or the fully specified `@v2.1.3`.

## Example

```yaml
name: create release
on:
  push:
    branches:
      - main
jobs:
  release:
    uses: entur/gha-meta/.github/workflows/release.yml@v1
```

## Inputs

<!-- AUTO-DOC-INPUT:START - Do not remove or modify this section -->

|                                INPUT                                 |  TYPE  | REQUIRED |  DEFAULT   |                                   DESCRIPTION                                   |
|----------------------------------------------------------------------|--------|----------|------------|---------------------------------------------------------------------------------|
|             <a name="input_path"></a>[path](#input_path)             | string |  false   |   `"."`    |                            Path to the release code                             |
| <a name="input_release_type"></a>[release_type](#input_release_type) | string |  false   | `"simple"` | The type of release to <br>create (simple, terraform-module, helm, maven, etc)  |

<!-- AUTO-DOC-INPUT:END -->

## Outputs

<!-- AUTO-DOC-OUTPUT:START - Do not remove or modify this section -->
No outputs.
<!-- AUTO-DOC-OUTPUT:END -->
