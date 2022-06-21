variable "ami_id" {
    type = string
    default = "ami-065deacbcaac64cf2"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "region" {
  type = string
  default = "eu-central-1"
}

variable "load_balancer_type" {
   type = string
  default = "application"
}
