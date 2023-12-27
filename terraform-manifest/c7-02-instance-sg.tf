module "service_sg" {
  source = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name        = "${local.name}-${var.inst_sg_name}"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks      = ["0.0.0.0/0"]
  egress_rules             = ["all-all"]
  ingress_rules            = ["ssh-tcp"]
  tags = local.common_tags

}