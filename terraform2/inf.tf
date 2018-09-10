#Create VPC

resource "aws_vpc" "terraform-vpc"
 {
    cidr_block = "${var.vpc-cidr}"
    tags 
        {
         Name = "$v{ar.vpc-name}"       
        }
 }

#Internal GAteway

resource "aws_internet_gateway" "terraform-igw"

