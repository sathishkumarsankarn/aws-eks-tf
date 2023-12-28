data "terraform_remote_state" "eks" {
  backend = "local"

  config = {
    path = "../aws-eks-vpc-terraform-manifest/terraform.tfstate"
  }
}

data "aws_eks_cluster" "cluster_name" {
  name = data.terraform_remote_state.eks.outputs.eks_cluster_name_output
}

data "aws_eks_cluster_auth" "cluster_auth" {
  name = data.terraform_remote_state.eks.outputs.eks_cluster_cert_auth_output
}

