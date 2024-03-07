module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "6.3.1"

  identifier = "task-station-${var.tag}-rds"

  create_db_option_group    = true
  create_db_parameter_group = true

  engine                          = "postgres"
  engine_version                  = "15"
  family                          = "postgres15"
  major_engine_version            = "15"
  instance_class                  = "db.t3.micro"
  allow_major_version_upgrade     = true
  apply_immediately               = true
  create_cloudwatch_log_group     = true
  allocated_storage               = 20
  max_allocated_storage           = 30
  create_monitoring_role          = true
  monitoring_interval             = 60
  monitoring_role_name            = "task-station-rds-monitoring-role"
  monitoring_role_use_name_prefix = true
  monitoring_role_description     = "Description for monitoring role"
  port                            = 5432
  deletion_protection             = true
  manage_master_user_password     = false
  publicly_accessible             = true
  storage_type                    = "gp2"
  db_name                         = var.pg_name
  username                        = var.pg_user
  password                        = var.pg_password

  db_subnet_group_name   = var.database_subnet_group_name
  vpc_security_group_ids = [var.postgres_db_sg_id]

  maintenance_window                    = "Mon:00:00-Mon:03:00"
  backup_window                         = "03:00-06:00"
  backup_retention_period               = 1
  delete_automated_backups              = true
  performance_insights_enabled          = false

  tags = {
    Terraform   = "true"
    Environment = var.tag
  }
}

