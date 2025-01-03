# # terraform par module

# two availability_zones issued
locals {
	availability_zones = ["${var.aws_region}a", "${var.aws_region}b"]
}

module "network" {
	source                                 = "../../modules/03_network"
	environment                            = var.environment
	aws_region                             = var.aws_region
	prefix_project                         = var.prefix_project
	vpc_main_cidr                          = var.vpc_main_cidr
	vpc_main_public_subnets_cidr           = var.vpc_main_public_subnets_cidr
	vpc_main_private_subnets_cidr          = var.vpc_main_private_subnets_cidr
	availability_zones                     = local.availability_zones
	ips_sg_ssh 							   = var.ips_sg_ssh
}


# Generate a new private key
resource "tls_private_key" "this" {
	algorithm = "RSA"
	rsa_bits  = 4096
}

# Create AWS key pair using the public key from the key generated above
resource "aws_key_pair" "this" {
	key_name   = "tgenez_test-key-pair"
	public_key = tls_private_key.this.public_key_openssh
}

# Optional: Save private key to a local file
resource "local_file" "private_key" {
	content  = tls_private_key.this.private_key_pem
	filename = "tgenez_test-key-pair.pem"

	# Make sure the private key file has restricted permissions
	file_permission = "0400"
}

# Get the latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux_2" {
	most_recent = true
	owners      = ["amazon"]

	filter {
		name   = "name"
		values = ["amzn2-ami-hvm-*-x86_64-gp2"]
	}
}

# create a public ec2
module "public_ec2" {
	source                                 = "../../modules/04_ec2"
	environment                            = var.environment
	aws_region                             = var.aws_region
	prefix_project                         = var.prefix_project
	ec2_name                               = "public-ec2"
	aws_key_pair_name                      = aws_key_pair.this.key_name
	associate_public_ip_address            = true
	aws_ami_id                             = data.aws_ami.amazon_linux_2.id
	sg_id                                  = module.network.aws_public_sg_id
	subnet_id                              = module.network.public_subnet_ids[0]
}

# create a private ec2
module "private_ec2" {
	source                                 = "../../modules/04_ec2"
	environment                            = var.environment
	aws_region                             = var.aws_region
	prefix_project                         = var.prefix_project
	ec2_name                               = "private-ec2"
	aws_key_pair_name                      = aws_key_pair.this.key_name
	associate_public_ip_address            = false
	aws_ami_id                             = data.aws_ami.amazon_linux_2.id
	sg_id                                  = module.network.ec2_private_sg_id
	subnet_id                              = module.network.private_subnet_ids[0]
}





