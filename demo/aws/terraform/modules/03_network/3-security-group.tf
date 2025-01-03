# Create a security group for RDS
resource "aws_security_group" "ec2_public_sg" {
  name        = "ec2_public_sg"
  description = "Allow traffic for public ec2"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    description = "Allow ssh traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ips_sg_ssh  # Be more specific in production
  }

  egress {
    description = "Allow ping traffic"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [var.vpc_main_cidr]
  }


  tags = {
    Name        = "${var.prefix_project}-${var.environment}-public-sg"
    environment = "${var.environment}"
  }
}


# Create a security group for ping
resource "aws_security_group" "ec2_private_sg" {
  name        = "ec2_private_sg"
  description = "Allow inbound traffic to RDS"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    description = "Allow ping"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [var.vpc_main_cidr]
  }


  tags = {
    Name        = "${var.prefix_project}-${var.environment}-ec2-private-sg"
    environment = "${var.environment}"
  }
}