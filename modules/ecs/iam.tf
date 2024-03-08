# Task definition for the ECS service
resource "aws_iam_role" "ecs_task_execution_role" {
  name               = "task-station-ecs-task-execution-role"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "ecs-tasks.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

resource "aws_iam_policy_attachment" "s3_full_access" {
  name       = "s3_full_access"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  roles      = [aws_iam_role.ecs_task_execution_role.name]
}

resource "aws_iam_policy_attachment" "ecs_task_execution_role" {
  name       = "ecs_task_execution_role"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  roles      = [aws_iam_role.ecs_task_execution_role.name]
}
resource "aws_iam_policy_attachment" "rds_full_access" {
  name       = "rds_full_access"
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
  roles      = [aws_iam_role.ecs_task_execution_role.name]
}

resource "aws_iam_role_policy" "ecs-service-role-policy" {
  name = "ecs_service_role_policy"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "elasticloadbalancing:Describe*",
          "elasticloadbalancing:DeregisterInstancesFromLoadBalancer",
          "elasticloadbalancing:RegisterInstancesWithLoadBalancer",
          "ec2:Describe*",
          "ec2:AuthorizeSecurityGroupIngress",
          "elasticloadbalancing:RegisterTargets",
          "elasticloadbalancing:DeregisterTargets",
          "elasticfilesystem:ClientMount",
          "elasticfilesystem:ClientWrite",
          "elasticfilesystem:ClientRootAccess",
          "elasticfilesystem:DescribeFileSystems",
          "ssm:GetParameters"
        ],
        "Resource" : [
          "*"
        ]
      }
    ]
  })
  role = aws_iam_role.ecs_task_execution_role.name
}

resource "aws_iam_role_policy" "ecs-task-execution-role-policy" {
  name = "ecs_task_execution_role_policy"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "ecs:StartTask",
          "ecs:StopTask",
          "ecs:DescribeTasks",
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "elasticfilesystem:ClientMount",
          "elasticfilesystem:ClientWrite",
          "elasticfilesystem:ClientRootAccess",
          "elasticfilesystem:DescribeFileSystems"
        ],
        "Resource" : "*"
      }
    ]
  })
  role = aws_iam_role.ecs_task_execution_role.name
}

resource "aws_iam_role" "ecs_task_role" {
  name               = "task-station-ecs-task-role"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "ecs-tasks.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy" "ecs-task-role-policy" {
  name = "ecs_task_role_policy"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "ssmmessages:CreateControlChannel",
          "ssmmessages:CreateDataChannel",
          "ssmmessages:OpenControlChannel",
          "ssmmessages:OpenDataChannel"
        ],
        "Resource" : "*"
      }
    ]
  })
  role = aws_iam_role.ecs_task_role.name
}