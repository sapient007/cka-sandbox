output "iaas" {
  value = "gcp"
}

output "project" {
  value = "${var.project}"
}

output "region" {
  value = "${var.region}"
}

output "network_name" {
  value = "${module.infra.network_name}"
}

output "infrastructure_subnet_cidr" {
  value = "${module.infra.ip_cidr_range}"
}

output "infrastructure_subnet_name" {
  value = "${module.infra.subnet_name}"
}

# # VM Information
output "master_node_public_ip" {
  value = "${module.k8s.master_node_public_ip}"
}

output "master_node_private_ip" {
  value = "${module.k8s.master_node_private_ip}"
}

output "worker_node1_public_ip" {
  value = "${module.k8s.worker_node1_public_ip}"
}

output "worker_node1_private_ip" {
  value = "${module.k8s.worker_node1_private_ip}"
}

output "worker_node2_public_ip" {
  value = "${module.k8s.worker_node2_public_ip}"
}

output "worker_node2_private_ip" {
  value = "${module.k8s.worker_node2_private_ip}"
}
