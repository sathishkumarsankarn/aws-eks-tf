terraform {
    required_version = "~> 1.0"
    required_providers {
        kubernetes = {
            source = "hashicorp/kubernetes"
            version = "~> 2.24"
        }
        aws = {
            source = "hashicorp/aws"
            version = "5.31.0"
        }
    }
    backend "s3" {
      bucket = "terraform-aws-eks-demoo"
      key = "dev/k8s-resource/terraform.tfstate"
      region = "us-east-1"

      dynamodb_table = "dev-k8sresource"
    }
}