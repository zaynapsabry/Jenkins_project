# create internet gateway
resource "aws_internet_gateway" "zeinab-gw" {
  vpc_id = aws_vpc.zeinab-vpc.id

  tags = {
    Name = "${var.tag_name}-gw"
  }
}
