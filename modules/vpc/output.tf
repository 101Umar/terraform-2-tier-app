output "region" {
  value = var.region
}

output "project_name" {
  value = var.project_name
}

output "vpc_id" {
  value = aws_vpc.vpc-1.id
}

output "public_subnet1_id" {
  value = aws_subnet.public_subnet1.id
}
output "public_subnet2_id" {
  value = aws_subnet.public_subnet2.id
}
output "private_subnet3_id" {
  value = aws_subnet.private_subnet3.id
}

output "private_subnet4_id" {
  value = aws_subnet.private_subnet4.id
}

output "private_subnet5_id" {
  value = aws_subnet.private_subnet5.id
}

output "private_subnet6_id" {
    value = aws_subnet.private_subnet6.id 
}

output "igw_id" {
    value = aws_internet_gateway.internet_gateway.id
}