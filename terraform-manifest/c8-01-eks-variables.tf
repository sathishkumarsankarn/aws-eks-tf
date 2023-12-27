variable "cluster_version" {
  type = string
  default = null
}

variable "cluster_private_access" {
  type = bool
  default = false
}

variable "cluster_public_access" {
  type = bool
  default = true
}

variable "cluster_public_access_cidr" {
  type = list(string)
  default = ["0.0.0.0/0"]
}

variable "cluster_service_ipv4_cidr" {
  description = "service ipv4 cidr for the kubernetes cluster"
  type        = string
  default     = null
}