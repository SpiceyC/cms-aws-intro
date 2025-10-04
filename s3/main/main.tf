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

resource "aws_iam_role" "primary-bucket-role" {
  name = "${var.bucket-name}-iamrole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
  }, ] })


}



resource "aws_iam_policy" "primary-bucket-role-policy" {
  name = "${var.bucket-name}-all-policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = "s3:*"
        Effect   = "Allow"
        Resource = aws_s3_bucket.primary-bucket.arn
    }, ]
  })
}

resource "aws_iam_role_policy_attachment" "primary_bucket_policy_and_role" {
  role       = aws_iam_role.primary-bucket-role.name
  policy_arn = aws_iam_policy.primary-bucket-role-policy.arn
}

