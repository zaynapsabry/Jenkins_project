# create vpc
resource "aws_vpc" "zeinab-vpc" {
  cidr_block       = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "${var.tag_name}-vpc"
  }
}





