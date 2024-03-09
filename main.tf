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

module "alb" {
  source = "./modules/alb"
  alb_acm_certificate_arn = var.alb_acm_certificate_arn
  alb_domain_name = var.alb_domain_name
  ecs_cluster_name = module.ecs.ecs_cluster_name
  public_subnets = module.vpc.public_subnets
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
  alb_sg_id = module.alb.alb_sg_id
  ts_auth_tg = module.alb.ts_auth_target_group_arn
  ts_integration_tg = module.alb.ts_integration_target_group_arn
  ts_platform_tg = module.alb.ts_platform_target_group_arn
  ts_report_tg = module.alb.ts_report_target_group_arn
}