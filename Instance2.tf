terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
 
provider "aws" {
  region = "eu-central-q"
}
resource "aws_instance" "example" {
  ami           = "ami-0a1ee2fb28fe05df3"
  instance_type = "t2.micro"
  count         = "1"
  user_data     = file("./script.sh")
  tags = {
    Name = "terraform-example"
  }
