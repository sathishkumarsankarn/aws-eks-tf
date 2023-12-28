resource "aws_eks_cluster" "eks-cluster" {
  name     = local.eks_cluster_name
  version = var.cluster_version
  role_arn = aws_iam_role.cluster_role.arn

  vpc_config {
    
    subnet_ids = module.vpc.private_subnets
    endpoint_private_access = var.cluster_private_access
    endpoint_public_access = var.cluster_public_access
    public_access_cidrs = var.cluster_public_access_cidr
  }
  kubernetes_network_config {
    service_ipv4_cidr = var.cluster_service_ipv4_cidr
  }

  enabled_cluster_log_types = [ "api", "audit", "controllerManager", "scheduler", "authenticator" ]

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.eks-demo-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eks-demo-AmazonEKSVPCResourceController,
  ]
}
