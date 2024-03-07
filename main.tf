terraform {
  backend "s3" {
    bucket                  = "task-station-terraform-state"
    key                     = "#{TAG}#/terraform.tfstate"
    region                  = "ap-south-1"
    encrypt                 = true
  }
}

provider "aws" {
  region                  = "ap-south-1"
}

module "vpc" {
  source = "./modules/vpc"
  ecs_service_sg_id = module.ecs.ecs_service_sg_id
  region = var.region
  tag = var.tag
}

module "rds" {
  source = "./modules/rds"
  database_subnet_group_name = module.vpc.database_subnet_group_name
  pg_name = var.pg_name
  pg_password = var.pg_password
  pg_user = var.pg_user
  postgres_db_sg_id = module.vpc.postgres_db_sg_id
  tag = var.tag
  vpc_id = module.vpc.vpc_id
}

module "ecs" {
  source = "./modules/ecs"
  account = var.account
  image_tag = var.image_tag
  public_subnets = module.vpc.public_subnets
  region = var.region
  tag = var.tag
  vpc_id = module.vpc.vpc_id
}