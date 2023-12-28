provider "aws" {
  region = var.aws_region
}


provider "kubernetes" {
  # Configuration options
  host = data.aws_eks_cluster.cluster_name.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster_name.certificate_authority[0].data)
  token = data.aws_eks_cluster_auth.cluster_auth.token
}