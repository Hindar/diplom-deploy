terraform {
  required_providers {
    yandex = { source = "yandex-cloud/yandex", version = "~>0.70.0" }
  }
}

data "yandex_compute_image" "image" {
  family = var.image-family
}

resource "yandex_compute_instance" "host" {
  zone        = var.region
  name        = var.name
  allow_stopping_for_update = true

  resources {
    cores         = var.ncpu
    memory        = var.mem
    core_fraction = var.cpu-fraq
  }

  scheduling_policy {
    preemptible = var.is-preemptible
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.image.id
      size     = var.boot-disk-size
    }
  }

  network_interface {
    subnet_id          = var.subnet
    nat                = var.i-addr
  }

  metadata = {
    user-data = <<EOT
#cloud-config
users:
  - name: ${var.login}
    groups: sudo
    shell: /bin/bash
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    ssh-authorized-keys:
      - "ubuntu:${file("~/.ssh/id_rsa.pub")}"
EOT
  }
}
