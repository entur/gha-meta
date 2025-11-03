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

|                                  INPUT                                  |  TYPE  | REQUIRED |              DEFAULT            |                                                                                                            DESCRIPTION                                                                                                            |
|-------------------------------------------------------------------------|--------|----------|---------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|    <a name="input_config_file"></a>[config_file](#input_config_file)    | string |  false   |  `"release-please-config.json"` |                  Path to the release-please config <br>in the repository. Defaults to <br>**release-please-config.json**. Must be used together <br>with release_type=manifest for this to <br>have any effect                    |
| <a name="input_manifest_file"></a>[manifest_file](#input_manifest_file) | string |  false   | `".release-please-manifest.json"` |           Path to the release-please versions <br>manifest in the repository. Defaults <br>to **.release-please-manifest.json**. Must be used <br>together with release_type=manifest for this <br>to have any effect           |
|              <a name="input_path"></a>[path](#input_path)               | string |  false   |               `"."`             |                                                                      Path to the release code <br>in the repository (where the CHANGELOG.md will be placed)                                                                       |
|  <a name="input_release_type"></a>[release_type](#input_release_type)   | string |  false   |            `"simple"`           | The type of release to <br>create (simple, terraform-module, helm, maven, manifest, etc). If set to <br>'manifest', you must provide **release-please-config.json** <br>and **.release-please-manifest.json** in the repository.  |
| <a name="input_target_branch"></a>[target_branch](#input_target_branch) | string |  false   |             ``              |  The target branch to release against. Defaults to the repository's default branch.                                                                                                                                                   |

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
