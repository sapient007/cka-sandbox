resource "google_compute_firewall" "nodes-external" {
  name    = "${var.env_name}-nodes-external"
  network = "${var.network_name}"

  allow {
    protocol = "tcp"
    ports    = ["22" ]
  }

  target_tags = ["${var.env_name}-master-node", "${var.env_name}-worker-node" ]
}


resource "google_compute_firewall" "k8s-external" {
  name    = "${var.env_name}-k8s-external"
  network = "${var.network_name}"

  allow {
    protocol = "tcp"
    ports    = ["8080", "443", "80", "6443"]
  }

  target_tags = ["${var.env_name}-master-node" ]
}