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

module "vms" {
  source = "../modules/vms"

  ssh_public_key = "${var.ssh_public_key}"
  env_name       = "${var.env_name}"
  network_name   = "${module.infra.network_name}"
  username       = "ubuntu"
  network        = "${module.infra.network}"
  zones          = "${var.zones}"
  subnet         = "${module.infra.subnet}"
  common_init_script      = "${var.common_init_script}"
  ssh_private_key         = "${var.ssh_private_key}"
}
