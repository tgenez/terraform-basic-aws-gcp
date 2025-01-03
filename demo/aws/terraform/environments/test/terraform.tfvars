aws_region = "eu-west-3"
prefix_project = "tgenez"
environment = "test"

vpc_main_cidr = "10.0.0.0/16"
vpc_main_public_subnets_cidr = ["10.0.0.0/24", "10.0.1.0/24"]
vpc_main_private_subnets_cidr = ["10.0.2.0/24", "10.0.3.0/24"]

ips_sg_ssh=["217.181.181.209/32"]