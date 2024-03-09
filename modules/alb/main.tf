module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "9.5.0"

  name    = "task-station-${var.tag}-alb"
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
    Environment = var.tag
  }
}

# Target group for ECS Fargate
resource "aws_alb_target_group" "task-station-v2-auth-target-group" {
  name        = "task-station-${var.tag}-auth-tg"
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

resource "aws_alb_target_group" "task-station-v2-platform-target-group" {
  name        = "task-station-${var.tag}-platform-tg"
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

resource "aws_alb_target_group" "task-station-v2-integration-target-group" {
  name        = "task-station-${var.tag}-integration-tg"
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

resource "aws_alb_target_group" "task-station-v2-report-target-group" {
  name        = "task-station-${var.tag}-report-tg"
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
  depends_on        = [
    aws_alb_target_group.task-station-v2-auth-target-group,
    aws_alb_target_group.task-station-v2-integration-target-group,
    aws_alb_target_group.task-station-v2-platform-target-group,
    aws_alb_target_group.task-station-v2-report-target-group
  ]


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
  depends_on        = [
    aws_alb_target_group.task-station-v2-auth-target-group,
    aws_alb_target_group.task-station-v2-integration-target-group,
    aws_alb_target_group.task-station-v2-platform-target-group,
    aws_alb_target_group.task-station-v2-report-target-group
  ]

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.task-station-v2-auth-target-group.arn
  }
}

resource "aws_alb_listener_rule" "task-station-auth-listener-rule" {
  listener_arn = aws_alb_listener.ecs-alb-https-listener.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.task-station-v2-auth-target-group.arn
  }

  condition {
    path_pattern {
      values = ["/tsauth/*"]
    }
  }

  condition {
    host_header {
      values = [var.alb_domain_name]
    }
  }
}

resource "aws_alb_listener_rule" "task-station-platform-listener-rule" {
  listener_arn = aws_alb_listener.ecs-alb-https-listener.arn
  priority     = 200

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.task-station-v2-platform-target-group.arn
  }

  condition {
    path_pattern {
      values = ["/tsplatform/*"]
    }
  }

  condition {
    host_header {
      values = [var.alb_domain_name]
    }
  }
}

resource "aws_alb_listener_rule" "task-station-integration-listener-rule" {
  listener_arn = aws_alb_listener.ecs-alb-https-listener.arn
  priority     = 300

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.task-station-v2-integration-target-group.arn
  }

  condition {
    path_pattern {
      values = ["/tsintegration/*"]
    }
  }

  condition {
    host_header {
      values = [var.alb_domain_name]
    }
  }
}

resource "aws_alb_listener_rule" "task-station-report-listener-rule" {
  listener_arn = aws_alb_listener.ecs-alb-https-listener.arn
  priority     = 400

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.task-station-v2-report-target-group.arn
  }

  condition {
    path_pattern {
      values = ["/tsreport/*"]
    }
  }

  condition {
    host_header {
      values = [var.alb_domain_name]
    }
  }
}