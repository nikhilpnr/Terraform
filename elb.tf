resource "aws_elb" "loadbalancer" {
  name = "elb"

  availability_zones = ["eu-central-1a", "eu-central-1b"]
  security_groups    = ["${aws_security_group.securitygroup.id}"]
  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = 80
    instance_protocol = "http"

  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
    target              = "HTTP:80/"
  }

}
