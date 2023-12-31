output "aws_az_output" {
  value = data.aws_availability_zones.aws_az.names
}

output "vpc_id_output" {
  value = module.vpc.vpc_id
}

output "vpc_public_subnets_output" {
  value = module.vpc.public_subnet_arns
}

output "vpc_private_subnets_output" {
  value = module.vpc.private_subnets
}

output "vpc_db_subnets_output" {
  value = module.vpc.database_subnets
}

output "ami_az_output" {
  value = keys(tomap({for az, i in data.aws_ec2_instance_type_offerings.az_instance: az => i.instance_types if length(i.instance_types) !=0}))
}

output "aws_key_pair_tags_output" {
  value = data.aws_key_pair.terraform_key.tags
}

output "aws_key_pair_name_output" {
  value = data.aws_key_pair.terraform_key.key_name
}

output "aws_free_tier_ami_output" {
  value = data.aws_ami.ami_inst.id
}

output "aws_free_tier_ami_name_output" {
  value = data.aws_ami.ami_inst.name
}

output "inst_sg_output" {
  value = module.service_sg.security_group_id
}

output "inst_eip_pub_dns_output" {
  value = aws_eip.inst_eip.public_dns
}

output "inst_eip_pub_ip_output" {
  value = aws_eip.inst_eip.public_ip
}

output "eks_cluster_name_output" {
  value = aws_eks_cluster.eks-cluster.id
}

output "eks_cluster_cert_auth_output" {
  value = aws_eks_cluster.eks-cluster.certificate_authority[0].data
}

output "eks_cluster_endpoint_output" {
  value = aws_eks_cluster.eks-cluster.endpoint
}

output "eks_cluster_tag_output" {
  value = aws_eks_cluster.eks-cluster.tags_all
}
output "eks_cluster_ng_id_public_output" {
  value = aws_eks_node_group.eks_ng_public.id
}

output "eks_cluster_ng_id_private_output" {
  value = aws_eks_node_group.eks_ng_private.tags_all
}

output "eks_ng_cluster_name_output" {
  value = aws_eks_node_group.eks_ng_public.cluster_name
}