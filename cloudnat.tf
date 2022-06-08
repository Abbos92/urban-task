module "cloud-nat" {
  source        = "terraform-google-modules/cloud-nat/google"
  version       = "~> 1.2"
  project_id    = var.project-id
  name          = "urban-cloudnat-1"
  region        = var.region
  router        = "urban-kube-router-1"
  create_router = true
  network       = "urban-vpc-1"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  depends_on = [
    module.gke
  ]
}