module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"

  name = "${local.name}-${var.inst_name}"

  instance_type          = var.aws_inst_type
  ami = data.aws_ami.ami_inst.id
  key_name               = data.aws_key_pair.terraform_key.key_name
  monitoring             = false
  vpc_security_group_ids = [module.service_sg.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = local.common_tags
}