terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.15.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "main"
  }
}

########## subnets

resource "aws_subnet" "main_subnet_a" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-west-1c"

  tags = {
    Name   = "Main"
    Subnet = "a"
  }
}

resource "aws_subnet" "main_subnet_b" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-west-1a"

  tags = {
    Name   = "Main"
    Subnet = "b"
  }
}

########## security groups - local

resource "aws_security_group" "allow_local" {
  name        = "allow_local"
  description = "Allow local inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main_vpc.id

  tags = {
    Name = "allow_local"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_local_ingress" {
  security_group_id = aws_security_group.allow_local.id
  cidr_ipv4         = "86.141.236.221/32"
  from_port         = 5432
  ip_protocol       = "tcp"
  to_port           = 5432

  tags = {
    Name = "allow_local_ingress"
  }
}

resource "aws_vpc_security_group_egress_rule" "allow_egress" {
  security_group_id = aws_security_group.allow_local.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"

  tags = {
    Name = "allow_local_egress"
  }
}

######### security group - allow tls

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow tls inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main_vpc.id

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ingress" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = aws_vpc.main_vpc.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443

  tags = {
    Name = "allow_tls_ingress"
  }
}


