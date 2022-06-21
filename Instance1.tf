provider "aws" {
  region  = "eu-central-1"
}
 
resource "aws_instance" "ec2-web" {
  ami           = "ami-0a1ee2fb28fe05df3"
  instance_type = "t2.micro"
 
  tags = {
    Name = "tf-ec2"
  }
}
