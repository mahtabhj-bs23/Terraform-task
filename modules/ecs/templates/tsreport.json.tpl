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
        "name": "AUTH_URL",
        "value": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/report/auth_url"
      },
      {
        "name": "GET_BY_IDS_MEMBER_URL",
        "value": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/report/get_by_ids_member_url"
      },
      {
        "name": "GET_ALL_ACTIVE_USER",
        "value": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/report/get_all_active_users"
      },
      {
        "name": "GET_USER_PROJECTS",
        "value": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/report/get_user_projects"
      },
      {
        "name": "GET_TASK_LOG",
        "value": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/report/get_task_log"
      },
      {
        "name": "REQUEST_TIMEOUT",
        "value": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/report/request_timeout"
      },
      {
        "name": "RESPONSE_READ_TIMEOUT",
        "value": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/report/response_read_timeout"
      }
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "/ecs/task-station-auth",
        "awslogs-region": "${region}",
        "awslogs-stream-prefix": "task-station-auth-log-stream"
      }
    }
  }
]