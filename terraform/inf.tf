provider "aws" {
  region  = "${var.region}"
  profile = "${var.aws_profile}"
}

resource "aws_instance" "SaltMaster" {
  ami           = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
  key_name      = "remi"

  tags {
    Name = "SaltMaster"
  }
}

resource "aws_security_group" "consul_uld" {
  name        = "consul_uld"
  description = "Allow all traffic in consul network"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "consul_uld"
  }
}

resource "aws_vpc" "consul_uld" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "dedicated"

  tags {
    Name = "consul_uld"
  }
}

