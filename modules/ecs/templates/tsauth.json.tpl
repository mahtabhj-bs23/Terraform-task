[
{
    "name": "task-station-auth",
    "image": "${docker_image_url_django}",
    "essential": true,
    "cpu": 256,
    "memory": 512,
    "portMappings": [
      {
        "containerPort": 8000,
        "protocol": "tcp"
      }
    ],
    "secrets": [
      {
        "name": "DEBUG",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/auth/debug"
      },
      {
        "name": "SECRET_KEY",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/auth/secret_key"
      },
      {
        "name": "AWS_ACCESS_KEY_ID",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/auth/aws_access_key_id"
      },
      {
        "name": "AWS_SECRET_ACCESS_KEY",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/auth/aws_secret_access_key"
      },
      {
        "name": "AWS_SES_REGION_NAME",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/auth/aws_ses_region_name"
      },
      {
        "name": "FRONTEND_URL",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/auth/frontend_url"
      },
      {
        "name": "EMAIL_FROM",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/auth/email_from"
      },
      {
        "name": "PLATFORM_BASE_URL",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/auth/platform_base_url"
      },
      {
        "name": "SYSTEM_USER_SECRET_KEY",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/auth/system_user_secret_key"
      },
      {
        "name": "POSTGRES_DB",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/auth/postgres_db"
      },
      {
        "name": "POSTGRES_USER",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/auth/postgres_user"
      },
      {
        "name": "POSTGRES_PASSWORD",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/auth/postgres_password"
      },
      {
        "name": "POSTGRES_HOST",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/auth/postgres_host"
      },
      {
        "name": "POSTGRES_PORT",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/auth/postgres_port"
      },
      {
        "name": "SYSTEM_USER_TOKEN",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/auth/system_user_token"
      },
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "/ecs/task-station-auth",
        "awslogs-region": "${region}",
        "awslogs-stream-prefix": "ecs"
      }
    }
  }
]