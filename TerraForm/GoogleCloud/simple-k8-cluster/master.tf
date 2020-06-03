provider "google" {
  project     = "${var.project}"
  region      = "${var.region}"
  credentials = "${var.service_account_key}"

  version = "~> 1.20"
}

terraform {
  required_version = "< 0.12.0"
}

module "infra" {
  source = "../modules/infra"

  project             = "${var.project}"
  env_name            = "${var.env_name}"
  region              = "${var.region}"
  infrastructure_cidr = "${var.infrastructure_cidr}"
  internetless        = "${var.internetless}"
}

module "k8s" {
  source = "../modules/k8s"

  ssh_public_key = "${var.ssh_public_key}"
  env_name       = "${var.env_name}"
  network_name   = "${module.infra.network_name}"
  username       = "ubuntu"
  network        = "${module.infra.network}"
  zones          = "${var.zones}"
  subnet         = "${module.infra.subnet}"
  common_init_script      = "${var.common_init_script}"
  master_node_init_script      = "${var.master_node_init_script}"
  worker_node_init_script      = "${var.worker_node_init_script}"
  kubectl_autocomplete_script  = "${var.kubectl_autocomplete_script}"
  ssh_private_key         = "${var.ssh_private_key}"
}
