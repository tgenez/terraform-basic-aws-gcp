
# Create EC2 instance
resource "aws_instance" "aws_instance_ec2" {
  ami           = var.aws_ami_id
  instance_type = "t2.micro"

  # Reference to your existing key pair
  key_name = var.aws_key_pair_name

  # Reference to your public subnet
  subnet_id = var.subnet_id

  # Enable public IP
  associate_public_ip_address = var.associate_public_ip_address

  # Reference to your security group
  vpc_security_group_ids = [var.sg_id]

  tags = {
    Name = "${var.prefix_project}-${var.environment}-${var.ec2_name}"
  }
}