# create public route table
resource "aws_route_table" "zeinab-public-rt" {
 vpc_id = aws_vpc.zeinab-vpc.id
 
 route {
   cidr_block = "0.0.0.0/0"
   gateway_id = aws_internet_gateway.zeinab-gw.id
 }
 
 tags = {
   Name = "${var.tag_name}-public-route-table"
 }
}


# assign public subnet to public route table
resource "aws_route_table_association" "public_subnet_asso" {
 subnet_id      = aws_subnet.zeinab-public-subnet.id
 route_table_id = aws_route_table.zeinab-public-rt.id
}
