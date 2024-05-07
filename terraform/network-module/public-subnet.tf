# create public subnet
resource "aws_subnet" "zeinab-public-subnet" {
 vpc_id     = aws_vpc.zeinab-vpc.id
 cidr_block = var.public_subnet_cidr
 availability_zone = "${var.region}a"
 map_public_ip_on_launch = true
 
 tags = {
   Name = "${var.tag_name}-public-subnet",
 }
}