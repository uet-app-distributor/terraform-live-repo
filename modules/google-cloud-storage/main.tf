resource "google_storage_bucket" "default_bucket" {
  for_each = toset(var.default_buckets)

  name          = each.value
  location      = "ASIA"
  force_destroy = true

  public_access_prevention = "enforced"
}

resource "google_storage_bucket_object" "empty_folder" {
  for_each = toset(var.empty_folders)

  bucket  = split("/", each.value)[0]
  name    = "${split("/", each.value)[1]}/"
  content = " "

  depends_on = [
    google_storage_bucket.default_bucket
  ]
}