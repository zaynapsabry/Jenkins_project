output vpc-id{
    value = aws_vpc.zeinab-vpc.id
    description = "vpc id"
}

output vpc-cidr{
    value = aws_vpc.zeinab-vpc.cidr_block
    description = "vpc cider"
}

output public-subnet-id{
    value = aws_subnet.zeinab-public-subnet.id
    description = "public subnet id"
}

output private-subnet-id-1{
    value = aws_subnet.zeinab-private-subnet-1.id
    description = "private subnet 1 id"
}

output private-subnet-id-2{
    value = aws_subnet.zeinab-private-subnet-2.id
    description = "private subnet 2 id"
}