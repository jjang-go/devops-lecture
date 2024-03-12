terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "4.57.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

locals {
  myip = "myip"
}

resource "aws_instance" "flask" {
  ami = "ami-01117fda37bb910d8"
  instance_type = "t2.micro"
  subnet_id = "subnet-0f195e131126e6d10"
  
  associate_public_ip_address = true
  key_name = "tykim"

  security_groups = []
  tags = {
    Name = "flask"
  }
}

# resource "aws_security_group" "default_sg" {
#   name        = "default_sg"

#   ingress {
#     from_port        = 5000
#     to_port          = 5000
#     protocol         = "tcp"
#     cidr_blocks      = [local.myip]
#   }

#   ingress {
#     from_port        = 22
#     to_port          = 22
#     protocol         = "tcp"
#     cidr_blocks      = [local.myip]
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }
# }