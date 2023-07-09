resource "random_string" "suffix" {
  length  = 5
  special = false
  upper   = false
}

resource "google_service_account" "default" {
  account_id  = "default-sa-${random_string.suffix.result}"
  description = "Default Service Account for GCE instance ${var.instance_name}"
}

resource "google_compute_instance" "default" {
  name                      = var.instance_name
  machine_type              = var.instance_machine_type
  allow_stopping_for_update = var.allow_stopping_for_update

  tags = var.instance_tags

  boot_disk {
    initialize_params {
      image = var.instance_image
      type  = var.instance_boot_disk_type
    }
  }

  network_interface {
    subnetwork = var.subnetwork_name
    access_config {
      nat_ip = var.static_public_ip
    }
  }

  metadata = {
    "ssh-keys" = <<EOT
      ${join("\n", var.ssh_keys)}
    EOT
  }

  service_account {
    email  = var.custom_sa_email != "" ? var.custom_sa_email : google_service_account.default.email
    scopes = var.default_sa_scopes
  }
}