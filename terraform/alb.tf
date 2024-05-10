// Target groups
resource "aws_lb_target_group" "my_tg_a" {
 name     = "target-group-a"
 port     = 3000
 protocol = "HTTP"
 vpc_id   = module.network.vpc-id
}

// Target group attachment
resource "aws_lb_target_group_attachment" "tg_attachment_a" {
 target_group_arn = aws_lb_target_group.my_tg_a.arn
 target_id        = aws_instance.zeinab-application.id
 port             = 3000
}

// ALB
resource "aws_lb" "my_alb" {
 name               = "my-alb"
 internal           = false
 load_balancer_type = "application"
 security_groups    = [aws_security_group.zeinab-security-group1.id]
 subnets            = [module.network.public-subnet-id-1, module.network.public-subnet-id-2]
}

// Listener
resource "aws_lb_listener" "my_alb_listener" {
 load_balancer_arn = aws_lb.my_alb.arn
 port              = 80
 protocol          = "HTTP"

 default_action {
   type             = "forward"
   target_group_arn = aws_lb_target_group.my_tg_a.arn
 }
}