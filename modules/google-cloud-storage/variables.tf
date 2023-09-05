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

variable public_buckets {
  type        = list(string)
  default     = []
  description = "Names of public bucket"
}

variable bucket_location {
  type        = string
  default     = "ASIA"
    description = "Location of buckets"
}
