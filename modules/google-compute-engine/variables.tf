############################################
## Required variables
############################################

variable instance_name {
  type        = string
  description = "Name of Compute Engine instance"
}

variable instance_machine_type {
  type        = string
  description = "Machine type of Compute Engine instance"
}

variable network_name {
  type        = string
  description = "Name of network to attach to the network interface of the instance"
}


############################################
## Optional variables
############################################

variable instance_tags {
  type        = list(string)
  default     = []
  description = "List of tags for instance"
}

variable default_sa_scopes {
  type        = list(string)
  default     = ["cloud-platform"]
  description = "Default scopes of instance service account"
}


variable custom_sa_email {
  type        = string
  default     = ""
  description = "Custom Service Account email"
}

variable ssh_key {
  type = object({
    user = string,
    key  = string
  })
  default = {
    user = "",
    key  = ""
  }
  description = "SSH key for instance"
}

variable instance_image {
  type        = string
  default     = "debian-cloud/debian-11"
  description = "Machine image for instance"
}

variable instance_boot_disk_type {
  type        = string
  default     = "pd-standard"
  description = "Type of boot disk for instance"
}
