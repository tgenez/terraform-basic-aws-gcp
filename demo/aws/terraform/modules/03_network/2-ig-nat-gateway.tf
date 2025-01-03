
# #Internet gateway
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name       = "${var.prefix_project}-${var.environment}-igw"
    environment = var.environment
  }
}

#
# # Route for Internet Gateway
resource "aws_route" "public_internet_gateway" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ig.id
}



# # Elastic-IP (eip) for NAT
# resource "aws_eip" "nat_eip" {
#   domain = "vpc"
#   depends_on = [aws_internet_gateway.ig]
# }
#
# # NAT Gateway
# resource "aws_nat_gateway" "nat" {
#   allocation_id = aws_eip.nat_eip.id
#   subnet_id     = element(aws_subnet.public_subnet.*.id, 0)
#   tags = {
#     Name        = "${var.prefix_project}-${var.environment}-nat-gateway"
#     environment = "${var.environment}"
#   }
# }

#
# # Route for NAT Gateway
# resource "aws_route" "private_internet_gateway" {
#   route_table_id         = aws_route_table.private.id
#   destination_cidr_block = "0.0.0.0/0"
#   nat_gateway_id             = aws_nat_gateway.nat.id
# }
