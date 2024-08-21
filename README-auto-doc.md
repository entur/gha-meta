# auto-doc

Generate markdown on inputs and outputs in reusable workflow.

Uses https://github.com/marketplace/actions/auto-doc

## Inputs

<!-- AUTO-DOC-INPUT:START - Do not remove or modify this section -->

|                                     INPUT                                     |  TYPE   | REQUIRED | DEFAULT |                           DESCRIPTION                           |
|-------------------------------------------------------------------------------|---------|----------|---------|-----------------------------------------------------------------|
|       <a name="input_readme_file"></a>[readme_file](#input_readme_file)       | string  |  false   |         |                     Path to the output file                     |
|           <a name="input_reusable"></a>[reusable](#input_reusable)            | boolean |  false   | `true`  | Boolean Indicating whether the file <br>is a reusable workflow  |
| <a name="input_timeout_minutes"></a>[timeout_minutes](#input_timeout_minutes) | number  |  false   |   `5`   |                     Job timeout in minutes                      |
|    <a name="input_workflow_file"></a>[workflow_file](#input_workflow_file)    | string  |  false   |         |                    Path to the workflow file                    |

<!-- AUTO-DOC-INPUT:END -->

## Outputs

<!-- AUTO-DOC-OUTPUT:START - Do not remove or modify this section -->
No outputs.
<!-- AUTO-DOC-OUTPUT:END -->
