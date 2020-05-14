resource "google_compute_address" "master-node" {
  name = "${var.env_name}-master-node-eip"
}

resource "google_compute_address" "worker-node1" {
  name = "${var.env_name}-worker-node1-eip"
}

resource "google_compute_address" "worker-node2" {
  name = "${var.env_name}-worker-node2-eip"
}