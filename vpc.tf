# primero crear la vpc y los bloques

# resource "aws_vpc" "vpc" {
#   cidr_block = var.vpc_cidr_block
#   enable_dns_hostnames = true
#   tags = {
#     Name = "VPC-DEJAVU"
#   }
# }
# resource "aws_vpc_ipv4_cidr_block_association" "cidr1" {
#   vpc_id     = aws_vpc.vpc.id
#   cidr_block = "10.250.0.0/16"
# }

# segundo las subnets

# resource "aws_subnet" "subnet1" {
#   cidr_block = "10.250.128.0/20"
#   vpc_id = aws_vpc.vpc.id
#   availability_zone = "us-east-1a"
# }
# resource "aws_subnet" "subnet2" {
#   cidr_block = "10.250.144.0/20"
#   vpc_id = aws_vpc.vpc.id
#   availability_zone = "us-east-1b"
# }
# resource "aws_subnet" "subnet3" {
#   cidr_block = "10.32.14.0/25"
#   vpc_id = aws_vpc.vpc.id
#   availability_zone = "us-east-1a"
# }
# resource "aws_subnet" "subnet4" {
#   cidr_block = "10.32.14.128/25"
#   vpc_id = aws_vpc.vpc.id
#   availability_zone = "us-east-1b"
# }
# resource "aws_db_subnet_group" "db_sub_gp" {
#   name       = "db-subnet-gp"
#   subnet_ids = [aws_subnet.subnet1.id, aws_subnet.subnet2.id, aws_subnet.subnet3.id, aws_subnet.subnet4.id]
# }
# resource "aws_route_table" "rtb1" {
#   vpc_id  = aws_vpc.vpc.id
#   #route = []
#   route {
#     cidr_block = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.nat_gateway1.id
#   }
# }
# resource "aws_route_table" "rtb2" {
#   vpc_id = aws_vpc.vpc.id
#   route {
#     cidr_block = "0.0.0.0/0"
#     transit_gateway_id  =  aws_ec2_transit_gateway.tgw.id
#   }
# }
# resource "aws_nat_gateway" "nat_gateway1" {
#   connectivity_type = "private"
#   subnet_id         = aws_subnet.subnet1.id  
# }
# resource "aws_nat_gateway" "nat_gateway2" {
#   connectivity_type = "private"
#   subnet_id         = aws_subnet.subnet2.id  
# }
# resource "aws_ec2_transit_gateway" "tgw" {
#   description = "terraform god xD"
#   dns_support = "enable"
#   auto_accept_shared_attachments = "enable"
#   vpn_ecmp_support  = "enable"
# }
# resource "aws_ec2_transit_gateway_vpc_attachment" "tgw-attachment" {
#   subnet_ids         = [aws_subnet.subnet3.id,aws_subnet.subnet4.id]
#   transit_gateway_id = aws_ec2_transit_gateway.tgw.id
#   vpc_id             = aws_vpc.vpc.id
# }



##############################################################
# data "aws_vpc" "vpc2" {
#   id = var.vpc_id2
# }
# data "aws_ec2_managed_prefix_list" "prefix_list" {
#   id = var.id_prefix
# }


#Explicit subnet associations

# resource "aws_route_table_association" "rta1-subnet1" {
#   subnet_id      = aws_subnet.subnet1.id
#   route_table_id = aws_route_table.rtb1.id
# }
# resource "aws_route_table_association" "rta1-subnet2" {
#   subnet_id      = aws_subnet.subnet2.id
#   route_table_id = aws_route_table.rtb1.id
# }
# resource "aws_route_table_association" "rta1-subnet3" {
#   subnet_id      = aws_subnet.subnet3.id
#   route_table_id = aws_route_table.rtb1.id
# }
# resource "aws_route_table_association" "rta1-subnet4" {
#   subnet_id      = aws_subnet.subnet4.id
#   route_table_id = aws_route_table.rtb1.id
# }

# resource "aws_route_table_association" "rta2-subnet1" {
#   subnet_id      = aws_subnet.subnet1.id
#   route_table_id = aws_route_table.rtb2.id
# }
# resource "aws_route_table_association" "rta2-subnet2" {
#   subnet_id      = aws_subnet.subnet2.id
#   route_table_id = aws_route_table.rtb2.id
# }
# resource "aws_route_table_association" "rta2-subnet3" {
#   subnet_id      = aws_subnet.subnet3.id
#   route_table_id = aws_route_table.rtb2.id
# }
# resource "aws_route_table_association" "rta2-subnet4" {
#   subnet_id      = aws_subnet.subnet4.id
#   route_table_id = aws_route_table.rtb2.id
# }














#################################################################









# resource "aws_subnet" "subnet1_yolo" {
#   cidr_block              = "10.250.0.0/20"
#   vpc_id                  = data.aws_vpc.vpc2.id
#   map_public_ip_on_launch = var.map_public_ip_on_launch
# }

# resource "aws_subnet" "subnet2_yolo" {
#   cidr_block              = "10.250.16.0/20"
#   vpc_id                  = data.aws_vpc.vpc2.id
#   map_public_ip_on_launch = var.map_public_ip_on_launch
# }

# resource "aws_route_table" "rtb-porlahorda" {
#   vpc_id         = data.aws_vpc.vpc2.id
# }
# resource "aws_route_table" "rtb-porlahorda2" {
#   vpc_id         = data.aws_vpc.vpc2.id
#   route {
#     cidr_block = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.example.id
#   }
#   # route {
#   #   destination_prefix_list_id = data.aws_ec2_managed_prefix_list.prefix_list.id
#   #   vpc_endpoint_id = aws_vpc_endpoint.s3.id
#   # }
# }
# resource "aws_route_table_association" "rta-subnet1" {
#   subnet_id      = aws_subnet.subnet1_yolo.id
#   route_table_id = aws_route_table.rtb-porlahorda.id
# }
# resource "aws_route_table_association" "rta-subnet2" {
#   subnet_id      = aws_subnet.subnet2_yolo.id
#   route_table_id = aws_route_table.rtb-porlahorda.id
# }
# resource "aws_vpc_endpoint_route_table_association" "example" {
#   route_table_id  = aws_route_table.rtb-porlahorda2.id
#   vpc_endpoint_id = aws_vpc_endpoint.s3.id
# }

# resource "aws_vpc_endpoint" "s3" {
#   vpc_id       = var.vpc_id2
#   service_name = "com.amazonaws.us-east-1.s3"
# }
# resource "aws_vpc_endpoint_policy" "example" {
#   vpc_endpoint_id = aws_vpc_endpoint.s3.id
#   policy = jsonencode({
#     "Version" : "2012-10-17",
#     "Statement" : [
#       {
#         "Sid" : "AllowAll",
#         "Effect" : "Allow",
#         "Principal" : {
#           "AWS" : "*"
#         },
#         "Action" : "*",
#         "Resource" : "*"
#       }
#     ]
#   })
# }

# resource "aws_internet_gateway" "gw" {
#   vpc_id = data.aws_vpc.vpc2.id

#   tags = {
#     Name = "lol"
#   }
# }

# resource "aws_nat_gateway" "example" {
#   connectivity_type = "private"
#   subnet_id         = aws_subnet.subnet1_yolo.id
    
# }