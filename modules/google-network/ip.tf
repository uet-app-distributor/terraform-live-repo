resource "google_compute_address" "instance_static_public_ip" {
  count = var.enable_instance_static_public_ip ? 1 : 0
  
  name = "instance-static-public-ip"
}