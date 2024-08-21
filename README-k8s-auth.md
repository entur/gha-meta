# k8s-auth

Action to authenticate with Kubernetes cluster.

## Inputs

<!-- AUTO-DOC-INPUT:START - Do not remove or modify this section -->
```yaml
- uses: entur/gha-meta@v1.1.8
  id: gha-meta
  with:
    # Azure cluster name, required when 
    # using Azure 
    # Type: string
    azure_cluster_name: ''

    # Azure cluster resource group, required 
    # when using Azure 
    # Type: string
    azure_cluster_resource_group: ''

    # Kubernetes token, required when using 
    # Azure 
    # Type: string
    azure_token: ''

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

    # Location of the Kubernetes cluster, 
    # GCP option 
    # Type: string
    # Default: "europe-west1"
    gcp_cluster_location: ''

    # Name of the Kubernetes cluster, 
    # required when using Google Cloud 
    # Type: string
    gcp_cluster_name: ''

    # Google Cloud project ID, required 
    # when using Google Cloud 
    # Type: string
    gcp_project_id: ''

```
<!-- AUTO-DOC-INPUT:END -->


## Outputs

<!-- AUTO-DOC-OUTPUT:START - Do not remove or modify this section -->
No outputs.
<!-- AUTO-DOC-OUTPUT:END -->
