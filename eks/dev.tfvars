# ---------------------------
# Environment
# ---------------------------
env         = "dev"
project_id = "my-gcp-project-id"

region = "us-central1"
zones  = ["us-central1-a", "us-central1-b", "us-central1-c"]

# ---------------------------
# GKE Cluster
# ---------------------------
cluster_name    = "gke-cluster"
cluster_version = "1.29"

enable_gke_cluster = true
private_cluster    = true

# ---------------------------
# Networking
# ---------------------------
vpc_name    = "dev-vpc"
subnet_name = "dev-subnet"

subnet_cidr   = "10.16.0.0/16"
pods_cidr     = "10.17.0.0/16"
services_cidr = "10.18.0.0/20"

# ---------------------------
# Node Pools (On-Demand)
# ---------------------------
ondemand_machine_type   = "e2-medium"
min_capacity_on_demand  = 1
max_capacity_on_demand  = 5

# ---------------------------
# Node Pools (Spot / Preemptible)
# ---------------------------
spot_machine_type = "e2-standard-2"
min_capacity_spot = 1
max_capacity_spot = 10

# ---------------------------
# GKE Addons
# ---------------------------
addons = {
  http_load_balancing        = true
  horizontal_pod_autoscaling = true
  gce_persistent_disk_csi   = true
}
