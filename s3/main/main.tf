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

resource "aws_s3_bucket" "primary-bucket" {
  bucket = var.bucket-name

  tags = {
    Name        = var.bucket-name
    Environment = "dev"
  }
}
