resource "google_compute_firewall" "default" {
  name    = "default-firewall-rule"
  network = google_compute_network.network.name

  allow {
    protocol = "tcp"
    ports    = var.default_firewall_ports
  }

  source_ranges = var.default_firewall_source_range
}