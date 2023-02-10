resource "aws_security_group" "RDS-databases-sg-Private" {
  name        = "RDS-databases-sg-Private"
  description = "Security group for RDS - Created by terraform"
  vpc_id      = data.aws_vpc.vpc2.id
  # tags = merge(local.common_tags, {
  #   Name = "${local.name_prefix}-RDS-databases-sg-Private"
  # })
}
resource "aws_security_group" "DMS-replication-instances-Private" {
  name        = "DMS-Private"
  description = "Security group for DMS replication instances - Created by terraform"
  vpc_id      = data.aws_vpc.vpc2.id
  # tags = merge(local.common_tags, {
  #   Name = "${local.name_prefix}-DMS-replication-instances-Private"
  # })
}
# AMAZON RDS AURORA POSTGRESQL INBOUND RULES OUTBOUND RULES

resource "aws_security_group_rule" "Service-Ingress_PostgreSQL" {
  description              = "These rules Allow PostgreSQL inbound traffic for DMS"
  from_port                = "5432"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.RDS-databases-sg-Private.id
  source_security_group_id = aws_security_group.DMS-replication-instances-Private.id
  to_port                  = "5432"
  type                     = "ingress"
}
resource "aws_security_group_rule" "RDS-Egress_all" {
  description              = "Allow this server to contact the outside world"
  from_port                = "-1"
  protocol                 = "-1"
  to_port                  = "-1"
  security_group_id        = aws_security_group.RDS-databases-sg-Private.id
  type                     = "egress"
  cidr_blocks              = ["0.0.0.0/0"]
}
resource "aws_security_group_rule" "DMS-Egress_all" {
  description              = "Allow this server to contact the outside world"
  from_port                = "-1"
  protocol                 = "-1"
  to_port                  = "-1"
  security_group_id        = aws_security_group.DMS-replication-instances-Private.id
  type                     = "egress"
  cidr_blocks              = ["0.0.0.0/0"]
}


###############################################################################
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