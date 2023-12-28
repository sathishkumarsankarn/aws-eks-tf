variable "inst_name" {
    type = string
    default = "ec2-bastion-eks-demo"
}

variable "aws_inst_type" {
  type = string
  default = "t2.micro"
}

variable "inst_sg_name" {
    type = string
    default = "ec2-bastion-eks-demo-sg"
}
