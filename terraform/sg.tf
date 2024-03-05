resource "aws_security_group" "web_ecs" {
  name        = "timing-web-application-ecs"
  description = "timing-web-application-ecs"
  vpc_id      = local.vpc_id


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


}


resource "aws_security_group_rule" "web_ecs_rule" {
  type                      = "ingress"
  security_group_id         = aws_security_group.web_ecs.id
  source_security_group_id  = local.web_alb_security_group_id
  from_port                 = 3000
  protocol                  = "tcp"
  to_port                   = 3000
}


resource "aws_security_group_rule" "app_ecs_rule" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = local.app_alb_security_group_id
  source_security_group_id = aws_security_group.web_ecs.id
}
