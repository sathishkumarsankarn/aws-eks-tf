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
}