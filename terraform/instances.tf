# Ami data source
data "aws_ami" "ubuntu" {
    most_recent = true
 
    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }
 
    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
 
    owners = ["099720109477"] 
}

# 7- create ec2(bastion) in public subnet with security group from 7
resource "aws_instance" "zeinab-bastion" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = module.network.public-subnet-id-1
  security_groups = [aws_security_group.zeinab-security-group1.id]
  key_name =  aws_key_pair.zeinab-public-key.key_name
  depends_on = [ local_file.private_key_file ]
   
   provisioner "file" {
    source      = var.source_path
    destination = var.destination_path   
    connection {
      type        = "ssh"
      user        = "ubuntu" 
      private_key = file(var.source_path)  
      host        = self.public_ip 
    }
  }

    provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /home/ubuntu/.ssh/id_rsa"  
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"  
      private_key = file(var.source_path)  
      host        = self.public_ip  
    }
  }

    provisioner "local-exec" {
        command = "echo ${self.public_ip} >> public_ips.txt"
    }

  tags = {
    Name = "${var.tag_name}-bastion"
  }
}

# 8- create ec2(application) private subnet with security group from 8
resource "aws_instance" "zeinab-application" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = module.network.private-subnet-id-1
  security_groups = [aws_security_group.zeinab-security-group2.id]
  key_name =  aws_key_pair.zeinab-public-key.key_name
  depends_on = [ aws_key_pair.zeinab-public-key ]

  tags = {
    Name = "${var.tag_name}-application"
  }
}
