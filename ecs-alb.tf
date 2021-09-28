resource "aws_lb" "load_balancer" {
  internal            = false
  name                = "terraform-ecs-load-balancer"
  subnets             = aws_subnet.public.*.id
  security_groups     = [aws_security_group.alb_security_group.id]
}
// ----------------------RED------------------
resource "aws_lb_target_group" "lb_target_group_red" {
  name        = "terraform-ecs-red-tg"
  port        = "81"
  protocol    = "HTTP"
  vpc_id      = aws_vpc.aws-vpc.id
  depends_on = [aws_lb.load_balancer]
  health_check {
    path                = "/"
    port                = 81
    healthy_threshold   = 6
    unhealthy_threshold = 2
    timeout             = 6
    interval            = 10
    }
}
//-------------------YELLOW--------------------------
resource "aws_lb_target_group" "lb_target_group_yellow" {
  name        = "terraform-ecs-yellow-tg"
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = aws_vpc.aws-vpc.id
  depends_on = [aws_lb.load_balancer]
  health_check {
    path                = "/"
    port                = 80
    healthy_threshold   = 6
    unhealthy_threshold = 2
    timeout             = 6
    interval            = 10
    }
}

//------------------BLUE-----------------------------
resource "aws_lb_target_group" "lb_target_group_blue" {
  name        = "terraform-ecs-blue-tg"
  port        = "82"
  protocol    = "HTTP"
  vpc_id      = aws_vpc.aws-vpc.id
  depends_on = [aws_lb.load_balancer]
  health_check {
    path                = "/"
    port                = 82
    healthy_threshold   = 6
    unhealthy_threshold = 2
    timeout             = 6
    interval            = 10
    }
}
resource "aws_lb_listener" "lb_listener" {
  default_action {
    target_group_arn = aws_lb_target_group.lb_target_group_yellow.arn
    type             = "forward"
  }

  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "80"
  protocol          = "HTTP"
}
resource "aws_lb_listener" "lb_listener_port_81" {
  default_action {
    target_group_arn = aws_lb_target_group.lb_target_group_red.arn
    type             = "forward"
  }

  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "81"
  protocol          = "HTTP"
}
resource "aws_lb_listener" "lb_listener_port_82" {
  default_action {
    target_group_arn = aws_lb_target_group.lb_target_group_blue.arn
    type             = "forward"
  }

  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "82"
  protocol          = "HTTP"
}