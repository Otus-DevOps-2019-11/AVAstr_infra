provider "google" {
  version = "~> 2.15"
  project = var.project
  region  = var.region
}

module "app" {
  source           = "../modules/app"
  public_key_path  = var.public_key_path
  zone             = var.zone
  app_disk_image   = var.app_disk_image
  private_key_path = var.private_key_path
}

module "db" {
  source          = "./modules/db"
  public_key_path = var.public_key_path
  zone            = var.zone
  db_disk_image   = var.db_disk_image
}

module "vpc" {
  source        = "./modules/vpc"
  source_ranges = ["0.0.0.0/0"]
}

#resource "google_compute_instance" "app" {
#  count        = var.instance_count
#  name         = "reddit-app${count.index}"
#  machine_type = "g1-small"
#  zone         = var.zone
#  tags         = ["reddit-app"]
#
#  boot_disk {
#    initialize_params {
#      image = var.disk_image
#    }
#  }
#  metadata = {
#    ssh-keys = <<EOF
#    appuser:${file(var.public_key_path)}
#    appuser1:${file(var.public_key_path)}
#    EOF
#  }
#  network_interface {
#    network = "default"
#    access_config {
#      nat_ip = google_compute_address.app_ip.address
#    }
#  }
#  connection {
#    type  = "ssh"
#    host  = self.network_interface[0].access_config[0].nat_ip
#    user  = "appuser"
#    agent = false
#    # путь до приватного ключа
#    private_key = file(var.private_key_path)
#  }
#  provisioner "file" {
#    source      = "files/puma.service"
#    destination = "/tmp/puma.service"
#  }
#  provisioner "remote-exec" {
#    script = "files/deploy.sh"
#  }
#}
#resource "google_compute_firewall" "firewall_puma" {
#  name = "allow-puma-default"
#  # Название сети, в которой действует правило
#  network = "default"
#  # Какой доступ разрешить
#  allow {
#    protocol = "tcp"
#    ports    = ["9292"]
#  }
#  # Каким адресам разрешаем доступ
#  source_ranges = ["0.0.0.0/0"]
#  # Правило применимо для инстансов с перечисленными тэгами
#  target_tags = ["reddit-app"]
#}
#resource "google_compute_firewall" "firewall_ssh" {
#  name = "default-allow-ssh"
#  network = "default"
#  description = "Modified SSH rule"
#  allow {
#    protocol = "tcp"
#    ports = ["22"]
#  }
#  source_ranges = ["0.0.0.0/0"]
#}
#resource "google_compute_project_metadata_item" "ssh-keys" {
#  key   = "ssh-keys"
#  value = "appuser:${var.public_key}"
#}
#resource "google_compute_address" "app_ip" {
#  name = "reddit-app-ip"
#}
