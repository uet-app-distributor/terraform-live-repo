resource "google_service_account" "distributor" {
  account_id   = "distributor-service-account"
  display_name = "Service Account for Distributor running on our Kubernetes cluster"
}

# resource "google_service_account_iam_member" "distributor_role" {
#   for_each = toset(var.distributor_roles)

#   service_account_id = google_service_account.distributor.name
#   role = each.value
#   member = google_service_account.distributor.member

#   depends_on = [
#     google_service_account.distributor
#   ]
# }
