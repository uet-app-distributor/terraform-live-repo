terraform {
  backend "gcs" {
    bucket = "uet-app-distributor-tfstate"
    prefix = "remote_state"
  }
}