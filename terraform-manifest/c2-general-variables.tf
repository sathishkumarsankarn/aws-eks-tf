variable "aws_region" {
  type = string
  default = "us-east-1"
}

variable "aws_key_pair" {
  type = string
  default = "terraform-key"
}


variable "app_category" {
  type = string
  default = "app"
}

variable "web_category" {
  type = string
  default = "web"
}

variable "db_category" {
  type = string
  default = "db"
}

variable "environment" {
  type = string
  default = "dev"
}