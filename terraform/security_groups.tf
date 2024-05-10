# 7- create security group which allow ssh, http, https from 0.0.0.0/0
resource "aws_security_group" "zeinab-security-group1" {
  name        = "${var.tag_name}-security-group1"
  description = "Allow SSH inbound traffic and all outbound traffic"
  vpc_id      = module.network.vpc-id

  ingress {
    description = "SSH ingress"
    from_port        = var.port_number1
    to_port          = var.port_number1
    protocol         = var.protocol
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP ingress"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS ingress"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "SSH egress"
    from_port        = var.port_number1
    to_port          = var.port_number1
    protocol         = var.protocol
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    description = "HTTP egress"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "HTTPS egress"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.tag_name}-security-group1"
  }
}

# 8- create security group that allow ssh and port 3000 from vpc cidr only
resource "aws_security_group" "zeinab-security-group2" {
  name        = "${var.tag_name}-security-group2"
  description = "Allow SSH inbound traffic and all outbound traffic"
  vpc_id      = module.network.vpc-id

  ingress {
    description = "SSH ingress"
    from_port        = var.port_number1
    to_port          = var.port_number1
    protocol         = var.protocol
    cidr_blocks      = [module.network.vpc-cidr]
  }

   ingress {
    description = "3000 ingress"
    from_port        = var.port_number2
    to_port          = var.port_number2
    protocol         = var.protocol
    cidr_blocks      = [module.network.vpc-cidr]
  }

    ingress {
    description = "HTTP ingress"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS ingress"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "HTTP egress"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "HTTPS egress"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.tag_name}-security-group2"
  }
}


# Define security group rules for ElastiCache
resource "aws_security_group" "elasticache_security_group" {
  name        = "elasticache-security-group"
  description = "Security group for ElastiCache cluster"
  vpc_id      = module.network.vpc-id

  # Allow incoming traffic from your application or other necessary sources
  ingress {
    from_port   = 6379  
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow outgoing traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}