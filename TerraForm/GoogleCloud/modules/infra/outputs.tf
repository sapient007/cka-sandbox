output "network" {
  value = "${google_compute_network.kubernetes.self_link}"
}

output "network_name" {
  value = "${google_compute_network.kubernetes.name}"
}

output "subnet" {
  value = "${google_compute_subnetwork.infrastructure.self_link}"
}

output "ip_cidr_range" {
  value = "${google_compute_subnetwork.infrastructure.ip_cidr_range}"
}

output "subnet_gateway" {
  value = "${google_compute_subnetwork.infrastructure.gateway_address}"
}

output "subnet_name" {
  value = "${google_compute_subnetwork.infrastructure.name}"
}

#DEPRECATED
output "subnet_cidrs" {
  value = ["${google_compute_subnetwork.infrastructure.ip_cidr_range}"]
}
