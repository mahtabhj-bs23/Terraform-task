module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.1"

  name = "task-station-${var.tag}-vpc"
  cidr = "40.0.0.0/16"

  azs             = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  public_subnets  = ["40.0.101.0/24", "40.0.102.0/24", "40.0.103.0/24"]

  enable_nat_gateway = false
  single_nat_gateway = false

  database_subnet_group_name             = "task-station-${var.tag}-database-subnet-group"
  database_subnets                       = ["40.0.50.0/24", "40.0.51.0/24", "40.0.52.0/24"]
  create_database_subnet_group           = true
  create_database_subnet_route_table     = true
  create_database_internet_gateway_route = true

  tags = {
    Terraform   = "true"
    Environment = var.tag
  }
}


# DB SG
resource "aws_security_group" "postgres_db_sg" {
  name        = "task-station-${var.tag}-db-sg"
  description = "Security group for PostgreSQL database"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["40.0.0.0/16"]
  }

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [var.ecs_service_sg_id]
  }

    ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["103.4.146.88/29"]
  }

    ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["182.160.98.80/29"]
  }

    ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["103.95.98.136/29"]
  }

    ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["103.95.99.144/29"]
  }

    ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["203.202.241.128/29"]
  }

    ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["103.197.207.32/29"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "postgres-db-sg"
  }
}
# Also need to add ECS Service SG as ingress for DB SG