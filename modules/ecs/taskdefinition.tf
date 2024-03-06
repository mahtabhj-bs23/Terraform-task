data "template_file" "tsauth-tmplate" {
  template = file("${path.module}/templates/tsauth.json.tpl")

  vars = {
    docker_image_url_django = "${var.account}.dkr.ecr.${var.region}.amazonaws.com/ts-dev-auth-service:${var.image_tag}"
    region                  = var.region
  }

}

resource "aws_ecs_task_definition" "task_station_auth_task_defination" {
  family                   = "task_station_auth_task_defination"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn
  container_definitions    = data.template_file.tsauth-tmplate.rendered
}

data "template_file" "tsintegration-tmplate" {
  template = file("${path.module}/templates/tsintegration.json.tpl")

  vars = {
    docker_image_url_django = "${var.account}.dkr.ecr.${var.region}.amazonaws.com/ts-dev-integration-service:${var.image_tag}"
    region                  = var.region
  }

}

resource "aws_ecs_task_definition" "task_station_integration_task_defination" {
  family                   = "task_station_integration_task_defination"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn
  container_definitions    = data.template_file.tsintegration-tmplate.rendered
}

data "template_file" "tsplatform-template" {
  template = file("${path.module}/templates/tsplatform.json.tpl")

  vars = {
    docker_image_url_django = "${var.account}.dkr.ecr.${var.region}.amazonaws.com/ts-dev-platform-service:${var.image_tag}"
    region                  = var.region
  }

}

resource "aws_ecs_task_definition" "task_station_platform_task_defination" {
  family                   = "task_station_platform_task_defination"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn
  container_definitions    = data.template_file.tsplatform-template.rendered
}

data "template_file" "tsreport-tmplate" {
  template = file("${path.module}/templates/tsreport.json.tpl")

  vars = {
    docker_image_url_django = "${var.account}.dkr.ecr.${var.region}.amazonaws.com/ts-dev-report-service:${var.image_tag}"
    region                  = var.region
  }

}

resource "aws_ecs_task_definition" "task_station_report_task_defination" {
  family                   = "task_station_report_task_defination"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn
  container_definitions    = data.template_file.tsreport-tmplate.rendered
}
