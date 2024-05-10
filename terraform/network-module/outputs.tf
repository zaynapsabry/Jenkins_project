output vpc-id{
    value = aws_vpc.zeinab-vpc.id
    description = "vpc id"
}

output vpc-cidr{
    value = aws_vpc.zeinab-vpc.cidr_block
    description = "vpc cider"
}

output public-subnet-id-1{
    value = aws_subnet.zeinab-public-subnet-1.id
    description = "public subnet 1 id"
}

output public-subnet-id-2{
    value = aws_subnet.zeinab-public-subnet-2.id
    description = "public subnet 2 id"
}

output private-subnet-id-1{
    value = aws_subnet.zeinab-private-subnet-1.id
    description = "private subnet 1 id"
}

output private-subnet-id-2{
    value = aws_subnet.zeinab-private-subnet-2.id
    description = "private subnet 2 id"
}

output nat-gateway{
    value = aws_nat_gateway.zeinab_ngw.id
    description = "nat gateway"
}