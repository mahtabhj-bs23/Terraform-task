[
{
    "name": "task-station-platform",
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
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/platform/debug"
      },
      {
        "name": "SECRET_KEY",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/platform/secret_key"
      },
      {
        "name": "POSTGRES_DB",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/platform/postgres_db"
      },
      {
        "name": "POSTGRES_USER",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/platform/postgres_user"
      },
      {
        "name": "POSTGRES_PASSWORD",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/platform/postgres_password"
      },
      {
        "name": "POSTGRES_HOST",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/platform/postgres_host"
      },
      {
        "name": "POSTGRES_PORT",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/platform/postgres_port"
      },
      {
        "name": "AWS_ACCESS_KEY_ID",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/platform/aws_access_key_id"
      },
      {
        "name": "AWS_SECRET_ACCESS_KEY",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/platform/aws_secret_access_key"
      },
       {
        "name": "AWS_SES_REGION_NAME",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/platform/aws_ses_region_name"
      },
      {
        "name": "FRONTEND_URL",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/platform/frontend_url"
      },
      {
        "name": "EMAIL_FROM",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/platform/email_from"
      },
      {
        "name": "TOKEN_VERIFY_URL",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/platform/token_verify_url"
      },
      {
        "name": "PATHS_TO_BYPASS",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/platform/paths_to_bypass"
      },
      {
        "name": "ISsuperUser",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/platform/is_super_user"
      },
      {
        "name": "AUTH_URL",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/platform/auth_url"
      },
      {
        "name": "GET_BY_IDS_MEMBER_URL",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/platform/get_by_ids_member_url"
      },
      {
        "name": "REQUEST_TIMEOUT",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/platform/request_timeout"
      },
      {
        "name": "RESPONSE_READ_TIMEOUT",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/platform/response_read_timeout"
      },
      {
        "name": "GET_USER_COUNT",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/platform/get_user_count"
      },
      {
        "name": "GET_ALL_ACTIVE_USER",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/platform/get_all_active_user"
      },
      {
        "name": "SYSTEM_USER_TOKEN",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/platform/system_user_token"
      }
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "/ecs/task-station-platform",
        "awslogs-region": "${region}",
        "awslogs-stream-prefix": "ecs"
      }
    }
  }
]