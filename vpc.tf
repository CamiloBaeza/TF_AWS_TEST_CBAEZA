data "aws_vpc" "vpc2" {
  id = var.vpc_id2
}
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  #enable_dns_hostnames = true
}

# resource "aws_subnet" "subnet1" {
#   cidr_block              = ["12.0.0.0/28"]
#   vpc_id                  = aws_vpc.vpc.id
#   availability_zone       = ["us-east-1b"]
# }
# resource "aws_subnet" "subnet2" {
#   cidr_block              = ["12.0.0.16/28"]
#   vpc_id                  = aws_vpc.vpc.id
#   availability_zone       = ["us-east-1b"]
# }

resource "aws_subnet" "subnet1_yolo" {
  cidr_block              = "10.250.0.0/20"
  vpc_id                  = data.aws_vpc.vpc2.id
  map_public_ip_on_launch = var.map_public_ip_on_launch
}

resource "aws_subnet" "subnet2_yolo" {
  cidr_block              = "10.250.16.0/20"
  vpc_id                  = data.aws_vpc.vpc2.id
  map_public_ip_on_launch = var.map_public_ip_on_launch
}

resource "aws_route_table" "rtb-porlahorda" {
  vpc_id         = data.aws_vpc.vpc2.id
  # route {
  #   saddsaads
  #   cidr_block = "10.250.0.0/20"
  # }
  # route {
  #   cidr_block = "10.250.16.0/20"
  # }
}
resource "aws_route_table_association" "rta-subnet1" {
  subnet_id      = aws_subnet.subnet1_yolo.id
  route_table_id = aws_route_table.rtb-porlahorda.id
}
resource "aws_route_table_association" "rta-subnet2" {
  subnet_id      = aws_subnet.subnet2_yolo.id
  route_table_id = aws_route_table.rtb-porlahorda.id
}