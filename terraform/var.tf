variable "region" { default = "eu-west-1" }
variable "aws_profile" { default = "remi" }

variable "amis" {
  type = "map"
  default = { "eu-west-1" = "ami-5f76b626" }
}

