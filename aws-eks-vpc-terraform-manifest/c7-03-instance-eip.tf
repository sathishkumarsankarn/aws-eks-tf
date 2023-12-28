resource "aws_eip" "inst_eip" {
    depends_on = [ module.ec2_instance, module.vpc ]
    instance = module.ec2_instance.id
    domain   = "vpc"
    tags = local.common_tags
}