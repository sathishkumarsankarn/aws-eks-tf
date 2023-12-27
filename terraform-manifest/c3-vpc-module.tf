module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.4.0"

  name = "vpc-${local.name}-${var.vpc_name}"
  cidr = var.cidr_block

  azs             = data.aws_availability_zones.aws_az.names
  private_subnets = var.public_subnet_cidr
  public_subnets  = var.private_subnet_cidr
  database_subnets = var.db_subnet_cidr
  create_database_subnet_group           = var.db_subnet_creation
  create_database_subnet_route_table     = var.db_route_table_creation
#   create_database_internet_gateway_route = var.db_subnet_igtw_creation
#   create_database_nat_gateway_route = var.db_subnet_natgtw_creation
#   enable_vpn_gateway = true

  enable_nat_gateway = var.ngtw_creation
  single_nat_gateway  = var.enable_single_ngtw
 

  enable_dns_hostnames = var.dns_hostname
  enable_dns_support   = var.dns_support
  map_public_ip_on_launch = var.map_publicip

  # Tags Concept -------------------->>>>
  tags = local.common_tags
  vpc_tags = local.common_tags

  public_subnet_tags = {
    Type = "Public Subnet"
    "kubernetes.io/role/elb" = 1    
    "kubernetes.io/cluster/${local.eks_cluster_name}" = "shared"
  }

  private_subnet_tags = {
    Type = "Private Subnet"
    "kubernetes.io/role/internal-elb" = 1   
    "kubernetes.io/cluster/${local.eks_cluster_name}" = "shared"
  }

  database_subnet_tags = {
    Type = "Database Subnet"
  }


}