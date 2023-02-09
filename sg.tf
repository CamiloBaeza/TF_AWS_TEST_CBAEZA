# resource "aws_security_group" "allow_tls" {
#   name        = "allow_tls"
#   description = "Allow TLS inbound traffic"
#   vpc_id      = var.vpc_id
#   ingress {
#     description      = "TLS from VPC"
#     from_port        = 443
#     to_port          = 443
#     protocol         = "tcp"
#     cidr_blocks      = [aws_vpc.vpc.cidr_block]
#   }
#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }
# }

# resource "aws_security_group_rule" "example" {
#   type              = "ingress"
#   from_port         = 0
#   to_port           = 65535
#   protocol          = "tcp"
#   cidr_blocks       = [aws_vpc.example.cidr_block]
#   security_group_id = "sg-123456"
# }

# resource "aws_security_group_rule" "example" {
#   type              = "ingress"
#   from_port         = 0
#   to_port           = 65535
#   protocol          = "tcp"
#   cidr_blocks       = [aws_vpc.example.cidr_block]
#   security_group_id = "sg-123456"
# }

# resource "aws_security_group_rule" "example" {
#   type              = "ingress"
#   from_port         = 0
#   to_port           = 65535
#   protocol          = "tcp"
#   cidr_blocks       = [aws_vpc.example.cidr_block]
#   security_group_id = "sg-123456"
# }

# resource "aws_security_group_rule" "example" {
#   type              = "ingress"
#   from_port         = 0
#   to_port           = 65535
#   protocol          = "tcp"
#   cidr_blocks       = [aws_vpc.example.cidr_block]
#   security_group_id = "sg-123456"
# }