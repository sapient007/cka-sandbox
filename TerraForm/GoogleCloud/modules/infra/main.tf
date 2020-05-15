resource "google_compute_network" "kubernetes" {
  name                    = "${var.env_name}-kubernetes-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "infrastructure" {
  name                     = "${var.env_name}-infrastructure-subnet"
  ip_cidr_range            = "${var.infrastructure_cidr}"
  network                  = "${google_compute_network.kubernetes.self_link}"
  region                   = "${var.region}"
  private_ip_google_access = "${var.internetless}"
}

// Allow open access between internal VMs for a PCF deployment
resource "google_compute_firewall" "kubernetes-internal" {
  name    = "${var.env_name}-kubernetes-internal"
  network = "${google_compute_network.kubernetes.self_link}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }
  target_tags = ["${var.env_name}-master-node", "${var.env_name}-worker-node" ]
  source_ranges = "${list(var.infrastructure_cidr)}"
}
