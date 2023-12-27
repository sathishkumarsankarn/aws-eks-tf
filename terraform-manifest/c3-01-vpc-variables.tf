variable "vpc_name" {
  type = string
  default = "bu-eks"
}

variable "cidr_block" {
  type = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidr" {
  type = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "db_subnet_cidr" {
  type = list(string)
  default = ["10.0.151.0/24", "10.0.152.0/24"]
}

variable "ngtw_creation" {
  type = bool
  default = true
}

variable "enable_single_ngtw" {
  type = bool
  default = true
}

variable "db_subnet_creation" {
  type = bool
  default = true
}

variable "db_route_table_creation" {
  type = bool
  default = true
}

variable "db_subnet_igtw_creation" {
  type = bool
  default = true
}
variable "db_subnet_natgtw_creation" {
  type = bool
  default = true
}

variable "dns_hostname" {
  type = bool
  default = false
}

variable "dns_support" {
  type = bool
  default = false
}

variable "map_publicip" {
  type = bool
  default = true
}