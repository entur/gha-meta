# docker-auth

Action to authenticate with Docker registry.

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
    # Default: "prd"
    environment: ''

    # Service account to use for 
    # authentication 
    # Type: string
    gcp_service_account: ''

    # Workload identity provider to use 
    # for authentication 
    # Type: string
    gcp_workload_identity_provider: ''

    # Output format for the generated 
    # authentication token. For OAuth 2.0 
    # access tokens, specify "access_token". For 
    # OIDC tokens, specify "id_token". To 
    # skip token generation, leave this 
    # value empty. 
    # Type: string
    # Default: "access_token"
    token_format: ''

```
<!-- AUTO-DOC-INPUT:END -->


## Outputs

<!-- AUTO-DOC-OUTPUT:START - Do not remove or modify this section -->
No outputs.
<!-- AUTO-DOC-OUTPUT:END -->
