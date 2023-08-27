variable distributor_roles {
  type        = list(string)
  default     = [
    "roles/storage.objectAdmin",
  ]
  description = "IAM roles for the Distributor"
}
