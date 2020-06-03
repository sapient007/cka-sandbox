variable "project" {
  type = "string"
}

variable "env_name" {
  type = "string"
}

variable "region" {
  type = "string"
}

variable "internetless" {
  default = true
}

variable "service_account_key" {
  type = "string"
}

variable "infrastructure_cidr" {
  type        = "string"
  description = "cidr for infrastructure subnet"
  default     = "192.168.0.0/23"
}

variable "ssh_public_key" {
  type = "string"
}

variable "zones" {
  type = "list"
}

variable "ssh_private_key" {
  type = "string"
}

variable "common_init_script" {
  description = "Path to the script for initiliazing vms with common set of tools."
  default     = "" 
}

variable "master_node_init_script" {
  description = "Path to the script to stand up a master node"
  default = ""  
}

variable "worker_node_init_script" {
  description = "Path to the script to have worker node join a cluster"
  default = ""
}

variable "kubectl_autocomplete_script" {
  description = "Path to the script to have worker node join a cluster"
  default = ""
}

