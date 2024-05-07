# create private subnet
resource "aws_subnet" "zeinab-private-subnet-1" {
 vpc_id     = aws_vpc.zeinab-vpc.id
 cidr_block = var.private_subnet_cidr_1
 availability_zone = "${var.region}a"
 
 tags = {
   Name = "${var.tag_name}-private-subnet1",
 }
}

resource "aws_subnet" "zeinab-private-subnet-2" {
 vpc_id     = aws_vpc.zeinab-vpc.id
 cidr_block = var.private_subnet_cidr_2
 availability_zone = "${var.region}b"
 
 tags = {
   Name = "${var.tag_name}-private-subnet2",
 }
}