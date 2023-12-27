data "aws_availability_zones" "aws_az" {
  state = "available"
}


data "aws_ec2_instance_type_offerings" "az_instance" {
  for_each = toset(data.aws_availability_zones.aws_az.names)
  filter {
    name   = "instance-type"
    values = ["${var.aws_inst_type}"]
  }

  filter {
    name   = "location"
    values = ["${each.key}"]
  }

  location_type = "availability-zone"
}


data "aws_key_pair" "terraform_key" {
  key_name           = "terraform-key1"
  include_public_key = true

  filter {
    name   = "tag:tools"
    values = ["terraform"]
  }
}


data "aws_ami" "ami_inst" {
  # executable_users = ["self"]
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}
