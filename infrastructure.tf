module "providers" {
  source = "./modules/providers"
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
  instance_machine_type = "e2-standard-2"
  instance_image        = "ubuntu-os-cloud/ubuntu-2204-lts"

  subnetwork_name  = module.network.subnetwork_name
  static_public_ip = module.network.instance_static_public_ip_address
}