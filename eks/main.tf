locals {
  org = "ap-medium"
  env = var.env
}

module "gke" {
  source = "../module"

  # -------- General --------
  env          = var.env
  project_id  = var.project_id
  region      = var.region
  zones       = var.zones

  cluster_name = "${local.env}-${local.org}-${var.cluster_name}"

  # -------- Networking --------
  vpc_name        = "${local.env}-${local.org}-${var.vpc_name}"
  subnet_name     = "${local.env}-${local.org}-${var.subnet_name}"
  subnet_cidr     = var.subnet_cidr

  pods_cidr       = var.pods_cidr
  services_cidr   = var.services_cidr

  enable_cloud_nat = true

  # -------- GKE Cluster --------
  enable_gke_cluster = var.enable_gke_cluster
  kubernetes_version = var.cluster_version
  private_cluster    = var.private_cluster

  # -------- Node Pools --------

  # On-Demand Nodes
  ondemand_node_pool = {
    name           = "ondemand-pool"
    machine_type   = var.ondemand_machine_type
    min_count      = var.min_capacity_on_demand
    max_count      = var.max_capacity_on_demand
    disk_size_gb   = 50
    auto_scaling   = true
    preemptible    = false
  }

  # Spot / Preemptible Nodes
  spot_node_pool = {
    name           = "spot-pool"
    machine_type   = var.spot_machine_type
    min_count      = var.min_capacity_spot
    max_count      = var.max_capacity_spot
    disk_size_gb   = 50
    auto_scaling   = true
    preemptible    = true
  }

  # -------- Addons --------
  addons = var.addons
}
