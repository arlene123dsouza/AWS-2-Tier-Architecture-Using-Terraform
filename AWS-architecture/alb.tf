resource "aws_lb" "alb" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  provider = aws.cal
  security_groups    = [aws_security_group.sg.id]
  subnets            = [aws_subnet.public_subnet1.id, aws_subnet.public_subnet2.id]

  enable_deletion_protection = false

  tags = {
    Environment = "ALB"
  }
}


resource "aws_lb_target_group" "alb_tg" {
  name     = "ALB-Target-Group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main_vpc.id
  provider = aws.cal
  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }
}


resource "aws_lb_listener" "front_end_listner" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"
  provider = aws.cal

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
}

resource "aws_lb_target_group_attachment" "alb_tg_attach1" {
  target_group_arn = aws_lb_target_group.alb_tg.arn
  target_id        = aws_instance.server1.id
  port             = 80
  provider = aws.cal
}

resource "aws_lb_target_group_attachment" "alb_tg_attach2" {
  target_group_arn = aws_lb_target_group.alb_tg.arn
  target_id        = aws_instance.server2.id
  port             = 80
  provider = aws.cal
}



