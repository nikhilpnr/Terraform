terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
 
provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "example" {
  ami           = "ami-068257025f72f470d"
  instance_type = "t2.micro"
  count         = "1"
  user_data     = <<EOF
#!/bin/bash
apt-get update
apt-get install -y apache2
systemctl start apache2
systemctl enable apache2
echo "<h1> Hello bosch</h1>" | sudo tee /var/www/html/index.html
EOF
  tags = {
    Name = "terraform-example"
  }
