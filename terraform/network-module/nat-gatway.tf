resource "aws_eip" "main_nat_eip" {
  # vpc = true
  domain = "vpc"
  tags = {
    "Name" = "${var.tag_name}-eip"
  }
}

resource "aws_nat_gateway" "zeinab_ngw" {
  allocation_id = aws_eip.main_nat_eip.id
  subnet_id     = aws_subnet.zeinab-public-subnet-1.id
  depends_on    = [aws_internet_gateway.zeinab-gw]

  tags = {
    Name = "${var.tag_name}-ngw"
  }
}