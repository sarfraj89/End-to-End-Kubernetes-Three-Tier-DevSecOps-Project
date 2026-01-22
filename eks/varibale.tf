# ---------------------------
# Global / Environment
# ---------------------------
variable "env" {
  description = "Environment name (dev / stage / prod)"
  type        = string
}

variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "zones" {
  description = "GCP zones for GKE node pools"
  type        = list(string)
}

# ---------------------------
# GKE Cluster
# ---------------------------
variable "cluster_name" {
  description = "GKE cluster name"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version for GKE"
  type        = string
}

variable "enable_gke_cluster" {
  description = "Enable or disable GKE cluster"
  type        = bool
  default     = true
}

variable "private_cluster" {
  description = "Enable private GKE cluster"
  type        = bool
  default     = true
}

# ---------------------------
# Networking
# ---------------------------
variable "vpc_name" {
  description = "VPC network name"
  type        = string
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
}

variable "subnet_cidr" {
  description = "Primary subnet CIDR"
  type        = string
}

variable "pods_cidr" {
  description = "CIDR range for GKE pods"
  type        = string
}

variable "services_cidr" {
  description = "CIDR range for GKE services"
  type        = string
}

# ---------------------------
# Node Pools (On-Demand)
# ---------------------------
variable "ondemand_machine_type" {
  description = "Machine type for on-demand node pool"
  type        = string
  default     = "e2-medium"
}

variable "min_capacity_on_demand" {
  type = number
}

variable "max_capacity_on_demand" {
  type = number
}

# ---------------------------
# Node Pools (Spot / Preemptible)
# ---------------------------
variable "spot_machine_type" {
  description = "Machine type for spot node pool"
  type        = string
  default     = "e2-medium"
}

variable "min_capacity_spot" {
  type = number
}

variable "max_capacity_spot" {
  type = number
}

# ---------------------------
# GKE Addons
# ---------------------------
variable "addons" {
  description = "Enable or disable GKE addons"
  type        = map(bool)
}
