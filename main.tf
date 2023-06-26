terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  backend "local" {
    path = "terraform.tfstate"
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = var.region
  profile = var.profile
}

module "vpc" {
  source = "./modules/vpc/"
  tags   = var.tags
}

module "rds" {
  source     = "./modules/rds"
  tags       = var.tags
  vpc        = module.vpc
  ecs_sg     = module.ecs.ecs_sg
  subnet_ids = keys(module.vpc.public_subnets)
}

