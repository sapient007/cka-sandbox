# Terraforming k8s clusterGCP

## What Does This Do?

You will use `terraform` to create vms that can be used to form a k8s cluster

## Prerequisites

Your system needs the `gcloud` cli, as well as `terraform`:

```bash
brew update
brew install Caskroom/cask/google-cloud-sdk
brew install terraform
```

## Deploying Infrastructure

Depending if you're deploying PAS, PKS or Control Plane you need to perform the following steps:

1. `cd` into the proper directory:
    - [vanilla-vm-cluster/](TerraForm/GoogleCloud/vanilla-vm-cluster/)
    - [simple-k8-cluster/](TerraForm/GoogleCloud/simple-k8-cluster)
1. Create [`terraform.tfvars`](/README.md#var-file) file
1. Run terraform apply:
  ```bash
  terraform init
  terraform plan -out=plan
  terraform apply plan
  ```

## Notes

You will need a key file for your [service account](https://cloud.google.com/iam/docs/service-accounts)
to allow terraform to deploy resources. If you don't have one, you can create a service account and a key for it:

```bash
gcloud iam service-accounts create ACCOUNT_NAME --display-name "Some Account Name"
gcloud iam service-accounts keys create "terraform.key.json" --iam-account "ACCOUNT_NAME@PROJECT_ID.iam.gserviceaccount.com"
gcloud projects add-iam-policy-binding PROJECT_ID --member 'serviceAccount:ACCOUNT_NAME@PROJECT_ID.iam.gserviceaccount.com' --role 'roles/owner'
```

You will need to enable the following Google Cloud APIs:
- [Identity and Access Management](https://console.developers.google.com/apis/api/iam.googleapis.com)
- [Cloud Resource Manager](https://console.developers.google.com/apis/api/cloudresourcemanager.googleapis.com/)
- [Cloud DNS](https://console.developers.google.com/apis/api/dns/overview)
- [Cloud SQL API](https://console.developers.google.com/apis/api/sqladmin/overview)
- [Compute Engine API](https://console.developers.google.com/apis/library/compute.googleapis.com)

### Var File

Copy the stub content below into a file called `terraform.tfvars` and put it in the root of this project.
These vars will be used when you run `terraform  apply`.
You should fill in the stub values with the correct content.

```hcl
env_name         = "some-environment-name"
project          = "your-gcp-project"
region           = "us-central1"
zones            = ["us-central1-a", "us-central1-b", "us-central1-c"]

ssl_private_key = <<SSL_KEY
-----BEGIN RSA PRIVATE KEY-----
some cert private key
-----END RSA PRIVATE KEY-----
SSL_KEY

service_account_key = <<SERVICE_ACCOUNT_KEY
{
  "type": "service_account",
  "project_id": "your-gcp-project",
  "private_key_id": "another-gcp-private-key",
  "private_key": "-----BEGIN PRIVATE KEY-----another gcp private key-----END PRIVATE KEY-----\n",
  "client_email": "something@example.com",
  "client_id": "11111111111111",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://accounts.google.com/o/oauth2/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/"
}
SERVICE_ACCOUNT_KEY
```

### Tearing down environment

**Note:** This will only destroy resources deployed by Terraform. You will need to clean up anything deployed on top of that infrastructure yourself

```bash
terraform destroy
```
