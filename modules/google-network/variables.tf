variable network_name {
  type        = string
  description = "Name of the network"
}

variable subnetwork_quantity {
  type        = number
  default     = 1
  description = "Number of subnetwork to create"
}

variable subnetwork_ip_cidr_range {
  type        = string
  default     = "10.1.0.0/16"
  description = "IP CIDR range for the main subnetwork"
}

variable enable_instance_static_public_ip {
  type        = bool
  default     = false
  description = "Enable creation of static public IP for an instance"
}
