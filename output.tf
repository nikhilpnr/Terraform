output "asg_arn" {
  value = aws_autoscaling_group.asg.arn
}
output "dns_elb" {
  value = aws_elb.loadbalancer.dns_name
}
#output "instance_id" {

# value = ["${aws_instance.ec2-web.*.id}"]

#}
