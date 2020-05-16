# start up scripts to 
data "template_file" "common_init_script" {
  template = "${file(var.common_init_script)}"

  vars {
    env_name = "${var.env_name}"
  }
}

data "template_file" "master_node_init_script" {
  template = "${file(var.master_node_init_script)}"

  vars {
    env_name = "${var.env_name}"
  }
}

# data "template_file" "worker_node_init_script" {
#   template = "${file(var.worker_node_init_script)}"

#   vars {
#     env_name = "${var.env_name}"
#   }
# }


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
  
  provisioner "file" {
    content     = "${data.template_file.common_init_script.rendered}"
    destination = "/tmp/common_init.sh"

    connection {
      type        = "ssh"
      user        = "${var.username}"
      private_key = "${var.ssh_private_key}"
    }
  }

  provisioner "file" {
    content     = "${data.template_file.master_node_init_script.rendered}"
    destination = "/tmp/master_node.sh"

    connection {
      type        = "ssh"
      user        = "${var.username}"
      private_key = "${var.ssh_private_key}"
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/common_init.sh",
      "/tmp/common_init.sh",
    ]

    connection {
      type        = "ssh"
      user        = "${var.username}"
      private_key = "${var.ssh_private_key}"
      agent       = false
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/master_node.sh",
      "/tmp/master_node.sh",
    ]

    connection {
      type        = "ssh"
      user        = "${var.username}"
      private_key = "${var.ssh_private_key}"
      agent       = false
    }
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
  provisioner "file" {
    content     = "${data.template_file.common_init_script.rendered}"
    destination = "/tmp/common_init.sh"

    connection {
      type        = "ssh"
      user        = "${var.username}"
      private_key = "${var.ssh_private_key}"
    }
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/common_init.sh",
      "/tmp/common_init.sh",
    ]

    connection {
      type        = "ssh"
      user        = "${var.username}"
      private_key = "${var.ssh_private_key}"
      agent       = false
    }
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
  provisioner "file" {
    content     = "${data.template_file.common_init_script.rendered}"
    destination = "/tmp/common_init.sh"

    connection {
      type        = "ssh"
      user        = "${var.username}"
      private_key = "${var.ssh_private_key}"
    }
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/common_init.sh",
      "/tmp/common_init.sh",
    ]

    connection {
      type        = "ssh"
      user        = "${var.username}"
      private_key = "${var.ssh_private_key}"
      agent       = false
    }
  }

}