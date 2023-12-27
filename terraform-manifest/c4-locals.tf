locals {
  name = "${var.app_category}-${var.environment}"
  common_tags = {
    env = var.environment
    name = local.name
  }
  eks_cluster_name = "${var.app_category}-${var.environment}-eks-demo"
}