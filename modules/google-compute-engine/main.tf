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
  name         = var.instance_name
  machine_type = var.instance_machine_type

  tags = var.instance_tags

  boot_disk {
    initialize_params {
      image = var.instance_image
      type  = var.instance_boot_disk_type
    }
  }

  network_interface {
    network = var.network_name

    access_config {}
  }

  metadata = {
    "ssh-keys" = <<EOT
      ${var.ssh_key.user}: ${var.ssh_key.key}
    EOT
  }

  service_account {
    email  = var.custom_sa_email != "" ? var.custom_sa_email : google_service_account.default.email
    scopes = var.default_sa_scopes
  }
}