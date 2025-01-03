output "aws_main_vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "private_subnet_ids" {
  description = "List of IDs of the private subnets"
  value       = aws_subnet.private_subnet[*].id
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnet[*].id
}


output "aws_public_sg_id" {
  value = aws_security_group.ec2_public_sg.id
}

output "ec2_private_sg_id" {
  value = aws_security_group.ec2_private_sg.id
}

