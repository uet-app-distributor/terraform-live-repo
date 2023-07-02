module providers {
  source = "./modules/providers"
}

module network {
  source = "./modules/google-network"
  network_name = "uet-app-distributor"

  depends_on = [module.providers]
}

module compute_engine {
  source = "./modules/google-compute-engine"
  instance_name = "distributor"
  instance_machine_type = "e2-standard-2"
  instance_image = "ubuntu-os-cloud/ubuntu-2204-lts"
  network_name = module.network.network_name
}