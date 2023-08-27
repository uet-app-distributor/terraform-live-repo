locals {
  platform_bucket = "uet-app-distributor"
}

module "providers" {
  source = "./modules/providers"
}

module "iam" {
  source = "./modules/google-cloud-iam"

  depends_on = [module.providers]
}

module "cloud_storage" {
  source = "./modules/google-cloud-storage"

  default_buckets = [
    local.platform_bucket
  ]

  empty_folders = [
    "${local.platform_bucket}/customer_apps",
    "${local.platform_bucket}/deployments"
  ]
}

module "network" {
  source                           = "./modules/google-network"
  network_name                     = "uet-app-distributor"
  enable_instance_static_public_ip = true

  depends_on = [module.providers]
}

module "compute_engine" {
  source                = "./modules/google-compute-engine"
  instance_name         = "distributor"
  instance_machine_type = "e2-standard-4"
  instance_image        = "ubuntu-os-cloud/ubuntu-2204-lts"

  subnetwork_name  = module.network.subnetwork_name
  static_public_ip = module.network.instance_static_public_ip_address[0]

  ssh_keys = [
    "thainm_uet:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC8Sb2S2p41lX0RZjQgSfnNNT+2ltdu+5diHkzSPWhe+h9xVgMrS/7iHUWzlrneJ2/MMwDbfPOrrpXrlCpzk48XlwHpT7vAm3T9NfPKwpQJWAHQ458N+XI8f9zpBbEiMdc2z49+AJsAmZ22vyu5N0eQXGkkKPaWu9vit2D9SSFtT8f5MjFbSGVYQESN+eY2FUeXgsob6qTR3wtWVi5b2lyKfZE7k6O34XYEkOZLaDLcLWQcxrsXhbvsgUQGfcL5i8EPKv1sX5WbeP4b+KxTL8zKFafs3xws5J00xFxuwdh+Ss63zDdLfzaW+l9S87mWtyW+GzGC+JxJJJ7TsCTTv7CYRuHIIGPSaborvNpakbovsCl3m1uRNn0E1eXsLpMrewvgnapg6BhyuD+e+cMkQKqJ8eygG7rIbLLOSpzcl2mvi266PitVIpT7Zy15TeiWUBWVjdtEPJLLMy+HhQk6dKkGKyV7KfKoanYg4pWKRzcYqWZMKRbGox2m9MicyhXMk30= thainguyen@fedora",
    "thainm_uet:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDIDDZn6ROHhoxwDHdd3YLeQjTDYLESgBP8L6cv/abg69y6QvNm8B0OWaRokJKZh2F+rVETpqU3SHWDSZB18D/crAUO82zo3NV7dMVYObHbcb19JkOHQA0hRHylgHsvfujJqR/cM3vAE/hl92JRFOMlYkWqgLB+x/L4vMQg9VV+WWb4vNEE0GlImf10eZiFgfB3PCRllIhG67nrbQGSg/KRu45WoIAACxqKv3b9mbospVngd8jj3srg9bcnQe50b18RZX0YrDML+b3D3BQN2T7FpiKwz8TX8vl7D7M5fIDpWkccOWysRIJt727oIpc6hQpiZJiJmDUPMqq2QHlRyVOP5sAfb6k2gvJwrJhYeu3IhnfSsPUcdNxSxQehx+bbu9APeCuxr1qjrHvbIrUrK9gop+eW8t1E75gNb37XRdXI7GH/E3RmWRNuHR6I2B8ja94MGU/fbgC8XddRDAkAIdy/ugXCqu0oMoKmBUuiXdpMr/oSXG5aDRl+gz/AIUyVVDc= thainm5hls@LPT00219130F"
  ]
}