variable region{
  type = string
  description = "region variable name"
}

variable vpc_cidr{
    type = string
    description = "vpc cidr block"
}

variable public_subnet_cidr{
    type = string
    description = "public subnet cidr block"
}

variable private_subnet_cidr_1{
    type = string
    description = "private subnet cidr block"
}

variable private_subnet_cidr_2{
    type = string
    description = "private subnet cidr block"
}

variable tag_name{
    type = string
    description = "identifier for resource tag name" 
}
