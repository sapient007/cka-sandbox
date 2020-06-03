variable "env_name" {}

variable "zones" {
  type = "list"
}

variable "subnet" {}

variable "username" {}

variable "ssh_public_key" {}

variable "network" {}

variable "network_name" {}

variable "common_init_script" {}

variable "ssh_private_key" {}

variable "master_node_init_script" {}

variable "worker_node_init_script" {}

variable "kubectl_autocomplete_script" {}

