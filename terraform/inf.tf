provider "aws" {
  region  = "${var.region}"
  profile = "${var.aws_profile}"
}

resource "aws_instance" "AnsibleMaster" {
  ami           = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
  key_name      = "remi"

  tags {
    Name = "AnsibleMaster"
  }
}