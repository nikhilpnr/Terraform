  region = "ap-south-1"
}
 
resource "aws_security_group" "instance" {
  name = "terraform-sg"
 
  ingress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  ingress {
    from_port   = 22
    to_port     = 22
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
resource "aws_launch_configuration" "example" {
  image_id                    = "ami-068257025f72f470d"
  instance_type               = "t2.micro"
  security_groups             = [aws_security_group.instance.id]
  associate_public_ip_address = true
 
  user_data = <<EOF
#!/bin/bash
apt-get update
apt-get install -y apache2
systemctl start apache2
systemctl enable apache2
echo "<h1> Hello bosch</h1>" | sudo tee /var/www/html/index.html
EOF
 
  lifecycle {
    create_before_destroy = true
  }
}
 
data "aws_vpc" "default" {
  default = true
}
 
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}
 
resource "aws_autoscaling_group" "example" {
  launch_configuration = aws_launch_configuration.example.name
  vpc_zone_identifier  = data.aws_subnets.default.ids
 
  min_size = 1
  max_size = 2
 
  tag {
    key                 = "Name"
    value               = "terraform-asg-example"
    propagate_at_launch = true
 
  }
}
