# VPC
resource "aws_vpc" "main_vpc" {
  cidr_block           = var.vpc_main_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = "${var.prefix_project}-${var.environment}-vpc"
    environment = var.environment
  }
}

# Public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main_vpc.id
  count                   = length(var.vpc_main_public_subnets_cidr)
  cidr_block              = element(var.vpc_main_public_subnets_cidr, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.prefix_project}-${var.environment}-${element(var.availability_zones, count.index)}-public-subnet"
    environment = "${var.environment}"
    # EKS annotation for the aws load balancer controller
   "kubernetes.io/role/elb" = 1
  }
}


# Private Subnet
resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.main_vpc.id
  count                   = length(var.vpc_main_private_subnets_cidr)
  cidr_block              = element(var.vpc_main_private_subnets_cidr, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = false

  tags = {
    Name        = "${var.prefix_project}-${var.environment}-${element(var.availability_zones, count.index)}-private-subnet"
    environment = "${var.environment}"
  }
}

# Routing tables to route traffic for Private Subnet
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name        = "${var.prefix_project}-${var.environment}-private-route-table"
    environment = "${var.environment}"
  }
}

# Routing tables to route traffic for Public Subnet
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name        = "${var.prefix_project}-${var.environment}-public-route-table"
    environment = "${var.environment}"
  }
}

# Route table associations for both Public subnet
resource "aws_route_table_association" "public" {
  count          = length(var.vpc_main_public_subnets_cidr)
  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count          = length(var.vpc_main_private_subnets_cidr)
  subnet_id      = element(aws_subnet.private_subnet.*.id, count.index)
  route_table_id = aws_route_table.private.id
}