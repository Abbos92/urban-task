module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"
  project_id                 = var.project-id
  name                       = "gke-urbant-test"
  region                     = var.region
  regional                   = false
  zones                      = ["us-east1-b"]
  network                    = "urban-vpc-1"
  subnetwork                 = "urban-kube-subnet-1"
  ip_range_pods              = "pod-address"
  ip_range_services          = "service-address"
  default_max_pods_per_node  = 32
  http_load_balancing        = false
  network_policy             = false
  horizontal_pod_autoscaling = true
  filestore_csi_driver       = false
  enable_private_endpoint    = false
  enable_private_nodes       = true
  master_ipv4_cidr_block     = "10.0.0.0/28"

  node_pools = [
    {
      name               = "urban-node-pool-1"
      machine_type       = "e2-medium"
      node_locations     = ""
      min_count          = 1
      max_count          = 60
      local_ssd_count    = 0
      disk_size_gb       = 20
      disk_type          = "pd-standard"
      image_type         = "COS_CONTAINERD"
      enable_gcfs        = false
      auto_repair        = true
      auto_upgrade       = true
      preemptible        = false
      initial_node_count = 2
    },
  ]

  node_pools_oauth_scopes = {
    all = []

    urban-node-pool-1 = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  node_pools_labels = {
    all = {}
  }

  node_pools_metadata = {
    all = {}
  }

  node_pools_taints = {
    all = []
  }

  node_pools_tags = {
    all = []
  }

  depends_on = [
    module.subnet
  ]
} 