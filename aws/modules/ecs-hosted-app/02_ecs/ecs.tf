# CLUSTER ######################################################################
# https://docs.aws.amazon.com/AmazonECS/latest/developerguide/clusters.html

resource "aws_ecs_cluster" "ecs" {
  name = var.ecs_cluster_name
}

# TASK DEFINITION ##############################################################
# https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definitions.html

resource "aws_ecs_task_definition" "ecs" {
  family                   = "${var.app_name}"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecsTaskExecutionRole.arn

  container_definitions = jsonencode([
    {
      name  = "${var.app_name}-container"
      image = "${var.aws_account_id}.dkr.ecr.${var.aws_region}.amazonaws.com/${var.image_tag}"
      essential = true
      portMappings = [
        {
          containerPort = var.app_port
          hostPort      = var.app_port
        }
      ]
      cpu    = 256
      memory = 512
    }
  ])
}

# SERVICE ######################################################################
# https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs_services.html

resource "aws_ecs_service" "ecs-service" {
  name            = "portfolio-service"                        
  cluster         = aws_ecs_cluster.ecs.id
  task_definition = aws_ecs_task_definition.ecs.arn
  launch_type     = "FARGATE"
  desired_count   = var.service_count

  load_balancer {
    target_group_arn = aws_lb_target_group.ecs-target_group.arn
    container_name   = "${var.app_name}-container"
    container_port   = var.app_port
  }

  network_configuration {
    subnets          = data.aws_subnets.default.ids
    assign_public_ip = true
    security_groups  = ["${aws_security_group.ecs-service_security_group.id}"]
  }
}
