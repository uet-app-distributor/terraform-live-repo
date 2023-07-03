variable "network_name" {
  type        = string
  description = "Name of the network"
}

variable "subnetwork_quantity" {
  type        = number
  default     = 1
  description = "Number of subnetwork to create"
}

variable "subnetwork_ip_cidr_range" {
  type        = string
  default     = "10.1.0.0/16"
  description = "IP CIDR range for the main subnetwork"
}

variable "enable_instance_static_public_ip" {
  type        = bool
  default     = false
  description = "Enable creation of static public IP for an instance"
}

variable "default_firewall_source_range" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "Source IP ranges for the default firewall rule"
}

variable "default_firewall_ports" {
  type        = list(string)
  default     = ["22", "80", "443", "8080"]
  description = "Allowed ports for the default firewall rule"
}
