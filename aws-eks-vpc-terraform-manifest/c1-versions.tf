terraform {
    required_version = "~> 1.0"
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 5.0"
        }
    }
    backend "s3" {
      bucket = "terraform-aws-eks-demoo"
      key = "dev/eks-cluster/terraform.tfstate"
      region = "us-east-1"

      dynamodb_table = "dev-ekscluster"
    }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}