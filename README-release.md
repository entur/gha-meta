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

|                                INPUT                                 |  TYPE  | REQUIRED |  DEFAULT   |                                       DESCRIPTION                                       |
|----------------------------------------------------------------------|--------|----------|------------|-----------------------------------------------------------------------------------------|
|             <a name="input_path"></a>[path](#input_path)             | string |  false   |   `"."`    | Path to the release code <br>in the repository (where the CHANGELOG.md will be placed)  |
| <a name="input_release_type"></a>[release_type](#input_release_type) | string |  false   | `"simple"` |     The type of release to <br>create (simple, terraform-module, helm, maven, etc)      |

<!-- AUTO-DOC-INPUT:END -->

## Outputs

<!-- AUTO-DOC-OUTPUT:START - Do not remove or modify this section -->

|                                     OUTPUT                                      |                         VALUE                          | DESCRIPTION |
|---------------------------------------------------------------------------------|--------------------------------------------------------|-------------|
|                 <a name="output_body"></a>[body](#output_body)                  |      `"${{ jobs.release-please.outputs.body }}"`       |             |
| <a name="output_release_created"></a>[release_created](#output_release_created) | `"${{ jobs.release-please.outputs.release_created }}"` |             |
|           <a name="output_tag_name"></a>[tag_name](#output_tag_name)            |    `"${{ jobs.release-please.outputs.tag_name }}"`     |             |
|             <a name="output_version"></a>[version](#output_version)             |     `"${{ jobs.release-please.outputs.version }}"`     |             |

<!-- AUTO-DOC-OUTPUT:END -->
