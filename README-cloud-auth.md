# cloud-auth

Action to authenticate with cloud provider.

## Inputs

<!-- AUTO-DOC-INPUT:START - Do not remove or modify this section -->
```yaml
- uses: entur/gha-meta@v1.1.8
  id: gha-meta
  with:
    # Azure client ID
    # Type: string
    azure_client_id: ''

    # Azure subscription ID
    # Type: string
    azure_subscription_id: ''

    # Azure tenant ID
    # Type: string
    azure_tenant_id: ''

    # Which cloud service provider to 
    # use - Google Cloud: 'gcp' 
    # or Azure: 'az' 
    # Type: string
    # Default: "gcp"
    cloud_provider: ''

    # GitHub environment to use Google 
    # Cloud: (dev, tst, prd) or Azure: (az-dev, az-test, az-prod) 
    # Type: string
    environment: ''

    # Service account to use for 
    # authentication towards Google Cloud 
    # Type: string
    gcp_service_account: ''

    # Workload identity provider to use 
    # for authentication against Google Cloud 
    # Type: string
    gcp_workload_identity_provider: ''

```
<!-- AUTO-DOC-INPUT:END -->


## Outputs

<!-- AUTO-DOC-OUTPUT:START - Do not remove or modify this section -->
No outputs.
<!-- AUTO-DOC-OUTPUT:END -->
