#https://developer.hashicorp.com/terraform/language/functions/cidrsubnets
variable "project" {
  type        = string
  description = "Project Name"
}

variable "sg_vpc_id" {
  type        = string
  description = "sg vpc ids"
}

variable "subnet_db_name" {
  type        = string
  description = "subnet db name"
}

variable "vpc_cidr_block" {
  type        = string
  description = "Base CIDR Block for VPC"
  default     = "12.0.0.0/16"
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Map a public IP address for Subnet instances"
  default     = true
}

variable "vpc_id2" {
  type        = string
  description = "sadasdas"
  default = "vpc-0845b166401067cbc"
}


variable "id_prefix" {
  type        = string
  description = "sadasdas"
  default = "pl-02cd2c6b"
}