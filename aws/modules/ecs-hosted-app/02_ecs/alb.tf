resource "aws_alb" "ecs-lb" {
  name               = "${var.app_name}-lb"
  load_balancer_type = "application"
  subnets            = data.aws_subnets.default.ids
  security_groups    = ["${aws_security_group.ecs-lb_security_group.id}"]
}

resource "aws_security_group" "ecs-lb_security_group" {
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb_target_group" "ecs-target_group" {
  name        = "${var.app_name}-target-group"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = data.aws_vpc.default.id
  health_check {
    matcher = "200,301,302"
    path    = "/"
  }
}

resource "aws_lb_listener" "ecs-lb-listener" {
  load_balancer_arn = aws_alb.ecs-lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ecs-target_group.arn
  }
}

output "lb_dns" {
  value       = aws_alb.ecs-lb.dns_name
  description = "AWS load balancer DNS Name"
}
