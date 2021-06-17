module "gke_private_cluster" {
  source                     = "../../../modules/google_kubernetes_engine/gke_private_cluster/"
  project_id                 = var.project
  name                       = "prod-projectid-app-us-ct1-gke"
  region                     = var.region
  network                    = var.network
  subnetwork                 = var.subnetwork
  ip_range_pods              = "prod-projectid-gke-pvt-us-ct1-pod-address-range"
  ip_range_services          = "prod-projectid-gke-pvt-us-ct1-service-address-range"
  regional                   = var.regional
  zones                      = var.zones
  http_load_balancing        = true
  network_policy             = false
  horizontal_pod_autoscaling = true
  enable_private_endpoint    = false
  enable_private_nodes       = true
  master_ipv4_cidr_block     = var.master_ipv4_cidr_block
  remove_default_node_pool   = true
  service_account            = var.service_account
  kubernetes_version         = var.gke_cluster_master_version
  cluster_resource_labels    = var.gce_labels
}

module "gke_node_pool" {
  source                         = "../../../modules/google_kubernetes_engine/gke_node_pool/"
  project_id                     = var.project
  gke_cluster_name               = module.gke_private_cluster.name
  node_pool_name                 = "prod-projectid-backend-node-pool-01"
  region                         = var.region
  regional                       = var.regional
  zones                          = module.gke_private_cluster.zones
  gke_cluster_min_master_version = var.gke_cluster_min_master_version
  image_type                     = var.image_type
  machine_type                   = var.machine_type
  preemptible                    = var.preemptible
  auto_upgrade                   = var.auto_upgrade
  auto_repair                    = var.auto_repair
  max_pods_per_node              = "100"
  node_count                     = var.node_count
  local_ssd_count                = "0"
  enable_autoscaling             = var.enable_autoscaling
  min_node_count                 = var.min_node_count
  max_node_count                 = var.max_node_count
  labels                         = var.kubernetes_labels
  disk_size_gb                   = var.disk_size_gb
  disk_type                      = var.disk_type
  service_account                = var.service_account
}
