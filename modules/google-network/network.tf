resource "google_compute_network" "network" {
  name = var.network_name
}

resource "google_compute_subnetwork" "main" {
  name          = "${var.network_name}_main_subnet"
  ip_cidr_range = var.subnetwork_ip_cidr_range
  network       = google_compute_network.network.id
}