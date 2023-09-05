resource "google_storage_bucket" "default_bucket" {
  for_each = toset(var.default_buckets)

  name          = each.value
  location      = var.bucket_location
  force_destroy = true

  public_access_prevention = "enforced"
}

resource "google_storage_bucket_object" "empty_folder" {
  for_each = toset(var.empty_folders)

  bucket  = split("/", each.value)[0]
  name    = "${split("/", each.value)[1]}/"
  content = " "

  depends_on = [
    google_storage_bucket.default_bucket,
    google_storage_bucket.public_buckets
  ]
}

resource "google_storage_bucket" "public_buckets" {
  for_each = toset(var.public_buckets)

  name          = each.value
  location      = var.bucket_location
  force_destroy = true
}

resource "google_storage_bucket_iam_member" "all" {
  for_each = google_storage_bucket.public_buckets

  bucket = google_storage_bucket.public_buckets[each.key].name
  role = "roles/storage.objectViewer"
  member = "allUsers"
}