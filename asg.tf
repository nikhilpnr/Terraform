resource "aws_autoscaling_group" "asg" {
  launch_configuration = aws_launch_configuration.launchconfig.id
  load_balancers       = ["${aws_elb.loadbalancer.name}"]
  availability_zones   = ["eu-central-1a", "eu-central-1b"]
  min_size             = 1
  max_size             = 3
  desired_capacity     = 2
  tag {
    key                 = "Name"
    value               = "asg"
    propagate_at_launch = true
  }
}
