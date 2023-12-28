provider "aws" {
  region = var.aws_region
}


provider "kubernetes" {
  # Configuration options
  host = ""
  cluster_ca_certificate = ""
  token = ""
}