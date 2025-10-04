output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "subnet_a_id" {
  value = aws_subnet.main_subnet_a.id
}

output "subnet_b_id" {
  value = aws_subnet.main_subnet_b.id
}

output "allow_local_sg_id" {
  value = aws_security_group.allow_local.id
}

output "allow_tls_sg_id" {
  value = aws_security_group.allow_tls.id
}