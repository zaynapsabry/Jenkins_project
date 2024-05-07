# create private route table
resource "aws_route_table" "zeinab-private-rt-1" {
  vpc_id = aws_vpc.zeinab-vpc.id

  tags = {
    Name = "${var.tag_name}-private-route-table-1"
  }
}

# assign private subnet to private route table
resource "aws_route_table_association" "private_subnet_asso_1" {
  subnet_id      = aws_subnet.zeinab-private-subnet-1.id
  route_table_id = aws_route_table.zeinab-private-rt-1.id
}


# create private route table
resource "aws_route_table" "zeinab-private-rt-2" {
  vpc_id = aws_vpc.zeinab-vpc.id

  tags = {
    Name = "${var.tag_name}-private-route-table-2"
  }
}

# assign private subnet to private route table
resource "aws_route_table_association" "private_subnet_asso_2" {
  subnet_id      = aws_subnet.zeinab-private-subnet-2.id
  route_table_id = aws_route_table.zeinab-private-rt-2.id
}