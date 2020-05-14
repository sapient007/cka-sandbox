# master node
output "master_node_private_ip" {
  value = "${element(concat(google_compute_instance.master-node.*.network_interface.0.address, list("")), 0)}"
}

output "master_node_public_ip" {
  value = "${google_compute_address.master-node.address}"
}
output "master_node_ip" {
  value = "${google_compute_address.master-node.address}"
}

# worker node 1
output "worker_node1_private_ip" {
  value = "${element(concat(google_compute_instance.worker-node1.*.network_interface.0.address, list("")), 0)}"
}

output "worker_node1_public_ip" {
  value = "${google_compute_address.worker-node1.address}"
}
output "worker_node1_ip" {
  value = "${google_compute_address.worker-node1.address}"
}

# worker node 2
output "worker_node2_private_ip" {
  value = "${element(concat(google_compute_instance.worker-node2.*.network_interface.0.address, list("")), 0)}"
}

output "worker_node2_public_ip" {
  value = "${google_compute_address.worker-node2.address}"
}
output "worker_node2_ip" {
  value = "${google_compute_address.worker-node2.address}"
}

