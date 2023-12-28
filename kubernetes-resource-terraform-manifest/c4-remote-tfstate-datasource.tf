# Local tfstate file concept --->

/*
data "terraform_remote_state" "eks" {
  backend = "local"
  config = {
    path = "../aws-eks-vpc-terraform-manifest/terraform.tfstate"
  }
}
*/

# Remote tfstate file from s3 as backend concept ---->
data "terraform_remote_state" "eks" {
  backend = "s3"

  config = {
    bucket = "terraform-aws-eks-demoo"
    key = "dev/k8s-resource/terraform.tfstate"
    region = "us-east-1"
  }
}

data "aws_eks_cluster" "cluster_name" {
  name = data.terraform_remote_state.eks.outputs.eks_cluster_name_output
}

data "aws_eks_cluster_auth" "cluster_auth" {
  name = data.terraform_remote_state.eks.outputs.eks_cluster_cert_auth_output
}

