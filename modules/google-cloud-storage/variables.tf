variable default_buckets {
  type        = list(string)
  default     = []
  description = "List of default bucket names"
}


variable empty_folders {
  type = list(string)
  default     = []
  description = "List of empty folders"
}
