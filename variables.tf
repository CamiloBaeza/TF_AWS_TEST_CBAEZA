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