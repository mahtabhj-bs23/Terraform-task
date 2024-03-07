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
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/debug"
      },
      {
        "name": "POSTGRES_DB",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/postgres_db"
      },
      {
        "name": "POSTGRES_USER",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/postgres_user"
      },
      {
        "name": "POSTGRES_PASSWORD",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/postgres_password"
      },
      {
        "name": "POSTGRES_HOST",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/postgres_host"
      },
      {
        "name": "POSTGRES_PORT",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/postgres_port"
      },
      {
        "name": "RABBITMQ_USER",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/rabbitmq_user"
      },
      {
        "name": "RABBITMQ_PASSWORD",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/rabbitmq_password"
      },
      {
        "name": "RABBITMQ_HOST",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/rabbitmq_host"
      },
      {
        "name": "RABBITMQ_PORT",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/rabbitmq_port"
      },
      {
        "name": "ATLASSIAN_AUTH_URL",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/atlassian_auth_url"
      },
      {
        "name": "ATLASSIAN_CLIENT_ID",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/atlassian_client_id"
      },
      {
        "name": "ATLASSIAN_CLIENT_SECRET",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/atlassian_client_secret"
      },
      {
        "name": "ATLASSIAN_AUTH_REDIRECT_URL",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/atlassian_auth_redirect_url"
      },
      {
        "name": "ATLASSIAN_API_BASE_URL",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/atlassian_api_base_url"
      },
      {
        "name": "ATLASSIAN_API_PREFIX",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/atlassian_api_prefix"
      },
      {
        "name": "ATLASSIAN_API_VERSION",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/atlassian_api_version"
      },
      {
        "name": "AUTH_URL",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/auth_url"
      },
      {
        "name": "TS_PLATFORM_BASE_API",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/ts_platform_base_api"
      },
      {
        "name": "REQUEST_TIMEOUT",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/request_timeout"
      },
      {
        "name": "RESPONSE_READ_TIMEOUT",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/response_read_timeout"
      },
      {
        "name": "SYSTEM_USER_TOKEN",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/system_user_token"
      },
      {
        "name": "ODOO_ERP_AUTH_URL",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/odoo_erp_auth_url"
      },
      {
        "name": "ODOO_ERP_PROJECT_URL",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/odoo_erp_project_url"
      },
      {
        "name": "ODOO_ERP_CREATE_TASK_URL",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/odoo_erp_create_task_url"
      },
      {
        "name": "ODOO_ERP_GET_EMPLOYEE",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/odoo_erp_get_employee"
      },
      {
        "name": "ODOO_ERP_BASE_URL",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/odoo_erp_base_url"
      },
      {
        "name": "ODOO_ERP_DB",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/odoo_erp_db"
      },
      {
        "name": "ODOO_ERP_PROTOCOL",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/odoo_erp_protocol"
      },
      {
        "name": "ODOO_ERP_TIMESHEET",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/odoo_erp_timesheet"
      },
      {
        "name": "MICROSOFT_AUTH_URL",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/microsoft_auth_url"
      },
      {
        "name": "MICROSOFT_TOKEN_URL",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/microsoft_token_url"
      },
      {
        "name": "MICROSOFT_CLIENT_ID",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/microsoft_client_id"
      },
      {
        "name": "MICROSOFT_CLIENT_SECRET",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/microsoft_client_secret"
      },
      {
        "name": "MICROSOFT_TENANT_ID",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/microsoft_tenant_id"
      },
      {
        "name": "MICROSOFT_SCOPES",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/microsoft_scopes"
      },
      {
        "name": "MICROSOFT_REDIRECT_URI",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/microsoft_redirect_url"
      },
      {
        "name": "MICROSOFT_BASE_API_URL",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/microsoft_base_api_url"
      },
      {
        "name": "MICROSOFT_EVENT_URL",
        "valueFrom": "arn:aws:ssm:ap-south-1:880451881092:parameter/taskstation/v2/integration/microsoft_event_url"
      }
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "/ecs/task-station-integration",
        "awslogs-region": "${region}",
        "awslogs-stream-prefix": "task-station-auth-log-stream"
      }
    }
  }
]