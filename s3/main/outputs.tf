output "bucket-name" {
  value = var.bucket-name
}

output "bucket-arn" {
  value = aws_s3_bucket.primary-bucket.arn
}
