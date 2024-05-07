# Generating public and private keys
# create private key
resource "tls_private_key" "zeinab-private-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private_key_file" {
  content  = tls_private_key.zeinab-private-key.private_key_pem
  filename = "${var.tag_name}-private-key.pem"
}

# create public key
resource "aws_key_pair" "zeinab-public-key" {
  key_name   = "${var.tag_name}-public-key"
  public_key = tls_private_key.zeinab-private-key.public_key_openssh
}