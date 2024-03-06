module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "9.5.0"

  name    = "piczangu-alb"
  vpc_id  = var.vpc_id
  subnets = var.public_subnets

  # Security Group
  security_group_ingress_rules = {
    all_http = {
      from_port   = 80
      to_port     = 80
      ip_protocol = "tcp"
      description = "HTTP web traffic"
      cidr_ipv4   = "0.0.0.0/0"
    }
    all_https = {
      from_port   = 443
      to_port     = 443
      ip_protocol = "tcp"
      description = "HTTPS web traffic"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }
  security_group_egress_rules = {
    all = {
      ip_protocol = "-1"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }

  tags = {
    Environment = var.environment
  }
}

# Target group for ECS Fargate
resource "aws_alb_target_group" "piczangu-target-group" {
  name        = "${var.ecs_cluster_name}-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    path                = "/health"
    port                = "8000"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 20
    interval            = 25
    matcher             = "200"
    protocol            = "HTTP"
  }
}

# Listener (redirects traffic from the load balancer to the target group)
resource "aws_alb_listener" "ecs-alb-http-listener" {
  load_balancer_arn = module.alb.arn
  port              = "80"
  protocol          = "HTTP"
  depends_on        = [aws_alb_target_group.piczangu-target-group]


  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }

}
resource "aws_alb_listener" "ecs-alb-https-listener" {
  load_balancer_arn = module.alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.alb_acm_certificate_arn
  depends_on        = [aws_alb_target_group.piczangu-target-group]

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.piczangu-target-group.arn
  }
}