terraform {
  required_version = ">= 1.7.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.81.0"
    }

  }

  # doit correspondre au information du bucket S3 créer
  backend "s3" {
    bucket         	   = "tgenez-terraform-state-s3"
    key                = "state/terraform.tfstate"
    region         	   = "eu-west-3"
    encrypt        	   = true
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs#AWS_PROFILE
provider "aws" {
  region = var.aws_region
}
