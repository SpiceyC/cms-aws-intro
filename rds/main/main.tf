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

resource "aws_db_subnet_group" "test_cluster_subnet_group" {
  name       = "test_cluster_subnet_group"
  subnet_ids = var.subnet_list

  tags = {
    Name = "test_cluster_subnet_group"
  }
}


# resource "aws_rds_cluster" "postgresql" {
#   cluster_identifier        = "test-cluster"
#   engine                    = "postgres"
#   availability_zones        = ["eu-west-1"]
#   db_cluster_instance_class = "db.t4g.micro"
#   database_name             = "mydb"
#   db_subnet_group_name      = aws_db_subnet_group.test_cluster_subnet_group.id
#   master_username           = "foo"
#   master_password           = "must_be_eight_characters"
#   vpc_security_group_ids    = [var.allow_local_sg_id]
# 
#   tags = {
#     Name = "aurora-test-cluster"
#   }
# }