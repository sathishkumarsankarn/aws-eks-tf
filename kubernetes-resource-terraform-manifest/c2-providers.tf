provider "aws" {
  region = var.aws_region
}


provider "kubernetes" {
  # Configuration options
  host = data.terraform_remote_state.eks.outputs.eks_cluster_endpoint_output
  cluster_ca_certificate = base64decode(data.terraform_remote_state.eks.outputs.eks_cluster_cert_auth_output)
  token = data.aws_eks_cluster_auth.cluster_auth.token
}