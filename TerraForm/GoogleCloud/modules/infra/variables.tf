variable "project" {
  type = "string"
}

variable "env_name" {
  default = ""
}

variable "region" {
  type = "string"
}

variable "internetless" {}

variable "infrastructure_cidr" {
  type = "string"
}
