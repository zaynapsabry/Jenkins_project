# create public subnet
resource "aws_subnet" "zeinab-public-subnet-1" {
 vpc_id     = aws_vpc.zeinab-vpc.id
 cidr_block = var.public_subnet_cidr_1
 availability_zone = "${var.region}a"
 map_public_ip_on_launch = true
 
 tags = {
   Name = "${var.tag_name}-public-subnet1",
 }
}

resource "aws_subnet" "zeinab-public-subnet-2" {
 vpc_id     = aws_vpc.zeinab-vpc.id
 cidr_block = var.public_subnet_cidr_2
 availability_zone = "${var.region}b"
 map_public_ip_on_launch = true
 
 tags = {
   Name = "${var.tag_name}-public-subnet2",
 }
}