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
    description = "private subnet 1 cidr block"
}

variable private_subnet_cidr_2{
    type = string
    description = "private subnet 2 cidr block"
}

variable instance_type{
    type = string
    description = "instance type"
}

variable tag_name{
    type = string
    description = "identifier for resource tag name" 
}

variable source_path{
    type = string
    description = "private key source file path"
}

variable destination_path{
    type = string
    description = "private key destination file path"
}

variable protocol{
    type = string
    description = "tcp protocol"
}

variable port_number1{
    type = number
    description = "Tcp port number"
}

variable port_number2{
    type = number
    description = "Tcp port number"
}

variable verified_email{
  type = string
  description = "tcp protocol" 
}