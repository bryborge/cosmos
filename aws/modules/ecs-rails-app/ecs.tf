resource "aws_ecs_cluster" "rails_cluster" {
  name = var.service_name
}

resource "aws_ecs_task_definition" "rails_task" {
  family                   = "${var.service_name}-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "512"
  memory                   = "1024"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = "${var.service_name}-app"
      image     = "${aws_ecr_repository.rails_app.repository_url}:latest"
      essential = true

      portMappings = [
        {
          containerPort = 3000
          hostPort      = 3000
        },
      ]
    },
  ])
}

resource "aws_iam_role" "ecs_task_execution_role" {
  name = "ecs_task_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
        Effect = "Allow"
        Sid    = ""
      },
    ]
  })
}

# resource "aws_security_group" "rails_sg" {
#   vpc_id = aws_vpc.vpc.id

#   ingress {
#     from_port   = 3000
#     to_port     = 3000
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# resource "aws_ecs_service" "rails_service" {
#   name            = "rails-service"
#   cluster         = aws_ecs_cluster.rails_cluster.id
#   task_definition = aws_ecs_task_definition.rails_task.arn
#   launch_type     = "FARGATE"

#   network_configuration {
#     subnets          = [aws_subnet.example.id]  # Specify your subnets
#     security_groups  = [aws_security_group.rails_sg.id]
#     assign_public_ip = true
#   }

#   desired_count = 1  # Specify the number of tasks to run

#   # Optionally, configure a load balancer here
# }
