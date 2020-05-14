resource "google_compute_firewall" "nodes-external" {
  name    = "${var.env_name}-nodes-external"
  network = "${var.network_name}"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  target_tags = ["${var.env_name}-master-node", "${var.env_name}-worker-node" ]
}

resource "google_compute_instance" "master-node" {
  name         = "${var.env_name}-master-node"
  machine_type = "n1-standard-2"
  zone         = "${element(var.zones, 1)}"
  
  tags = ["${var.env_name}", "${var.env_name}-master-node"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1604-lts"
      size  = "100"
    }
  }

  // Local SSD disk
  scratch_disk {}

  network_interface {
    subnetwork = "${var.subnet}"

    access_config {
      nat_ip = "${google_compute_address.master-node.address}"
    }
  }
  metadata {
    ssh-keys               = "${format("ubuntu:%s", var.ssh_public_key)}"
    block-project-ssh-keys = "TRUE"
  }

}

resource "google_compute_instance" "worker-node1" {
  name         = "${var.env_name}-worker-node1"
  machine_type = "n1-standard-2"
  zone         = "${element(var.zones, 1)}"

  tags = ["${var.env_name}", "${var.env_name}-worker-node"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1604-lts"
      size  = "100"
    }
  }

  // Local SSD disk
  scratch_disk {}

  network_interface {
    subnetwork = "${var.subnet}"

    access_config {
      nat_ip = "${google_compute_address.worker-node1.address}"
    }

  }
  metadata {
    ssh-keys               = "${format("ubuntu:%s", var.ssh_public_key)}"
    block-project-ssh-keys = "TRUE"
  }

}

resource "google_compute_instance" "worker-node2" {
  name         = "${var.env_name}-worker-node2"
  machine_type = "n1-standard-2"
  zone         = "${element(var.zones, 1)}"

  tags = ["${var.env_name}", "${var.env_name}-worker-node"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1604-lts"
      size  = "100"
    }
  }

  // Local SSD disk
  scratch_disk {}

  network_interface {
    subnetwork = "${var.subnet}"

    access_config {
      nat_ip = "${google_compute_address.worker-node2.address}"
    }
  }
  metadata {
    ssh-keys               = "${format("ubuntu:%s", var.ssh_public_key)}"
    block-project-ssh-keys = "TRUE"
  }

}