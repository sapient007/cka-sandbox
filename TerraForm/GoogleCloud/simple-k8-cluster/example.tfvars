env_name         = "mling-test"
project          = "control-plane-275516"
region           = "us-central1"
zones            = ["us-central1-a", "us-central1-b", "us-central1-c"]
zone             = "us-central1-a"    #zone to spin up vms

ssh_public_key = <<SSH_KEY
< insert your ssh key here >
SSH_KEY

ssh_private_key = <<SSH_KEY
<insert your private key here> 
SSH_KEY

service_account_key = <<SERVICE_ACCOUNT_KEY
{
  "type": "service_account",
  "project_id": "hihi",
  "private_key_id": "samplesamplesamplesamplesamplesamplesample",
  "private_key": "samplesamplesamplesamplesamplesample",
  "client_email": "samplesamplesamplesamplesamplesamplesamplesample",
  "client_id": "samplesamplesamplesample",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "samplesamplesamplesamplesamplesamplesample"
}
SERVICE_ACCOUNT_KEY


common_init_script = "../scripts/common.sh"
master_node_init_script = "../scripts/master_node.sh"
worker_node_init_script = "../scripts/worker_node.sh"