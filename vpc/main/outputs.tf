output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "subnet_a_id" {
  value = aws_subnet.main_subnet_a.id
}

output "subnet_b_id" {
  value = aws_subnet.main_subnet_b.id
}