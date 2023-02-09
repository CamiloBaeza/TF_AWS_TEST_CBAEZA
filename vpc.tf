resource "aws_vpc" "vpc" {
  cidr_block           = ["12.0.0.0/27"]
  #enable_dns_hostnames = true
}

resource "aws_subnet" "subnet1" {
  cidr_block              = ["12.0.0.0/28"]
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = ["us-east-1b"]
}
resource "aws_subnet" "subnet2" {
  cidr_block              = ["12.0.0.16/28"]
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = ["us-east-1b"]
}


resource "aws_route_table" "rtb-porlahorda" {
  vpc_id         = aws_vpc.vpc.id
  route {
    cidr_block = "10.32.14.0/24"
  }
  route {
    cidr_block = "10.250.0.0/16"
  }
  tags = local.common_tags
}