data "aws_vpc" "vpc2" {
  id = var.vpc_id2
}
data "aws_ec2_managed_prefix_list" "prefix_list" {
  id = var.id_prefix
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
}
resource "aws_route_table" "rtb-porlahorda2" {
  vpc_id         = data.aws_vpc.vpc2.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.example.id
  }
  # route {
  #   destination_prefix_list_id = data.aws_ec2_managed_prefix_list.prefix_list.id
  #   vpc_endpoint_id = aws_vpc_endpoint.s3.id
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
resource "aws_route_table_association" "rta-subnet1a" {
  subnet_id      = aws_subnet.subnet1_yolo.id
  route_table_id = aws_route_table.rtb-porlahorda2.id
}
resource "aws_route_table_association" "rta-subnet2a" {
  subnet_id      = aws_subnet.subnet2_yolo.id
  route_table_id = aws_route_table.rtb-porlahorda2.id
}
# resource "aws_vpc_endpoint_route_table_association" "example" {
#   route_table_id  = aws_route_table.rtb-porlahorda2.id
#   vpc_endpoint_id = aws_vpc_endpoint.s3.id
# }

resource "aws_vpc_endpoint" "s3" {
  vpc_id       = var.vpc_id2
  service_name = "com.amazonaws.us-east-1.s3"
}
resource "aws_vpc_endpoint_policy" "example" {
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "AllowAll",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : "*"
        },
        "Action" : "*",
        "Resource" : "*"
      }
    ]
  })
}

# resource "aws_internet_gateway" "gw" {
#   vpc_id = data.aws_vpc.vpc2.id

#   tags = {
#     Name = "lol"
#   }
# }

resource "aws_nat_gateway" "example" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.subnet1_yolo.id
    
  }