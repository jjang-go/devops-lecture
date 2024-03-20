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

variable "myIP" {
  type = string
}

variable "mySubnetID" {
  type = string
}

variable "myKeyName" {
  type = string
}

variable "myVPCID" {
  type = string
}

resource "aws_instance" "echo" {
  depends_on = [ aws_security_group.default_sg ]

  ami = "ami-01117fda37bb910d8"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.default_sg.id ]
  subnet_id = var.mySubnetID
  
  associate_public_ip_address = true
  key_name = var.myKeyName

  tags = {
    Name = "echo"
  }
}

resource "aws_instance" "cicd" {
  depends_on = [ aws_security_group.cicd_sg ]
  ami = "ami-01117fda37bb910d8"
  instance_type = "m5.large"
  vpc_security_group_ids = [ aws_security_group.cicd_sg.id ]
  subnet_id = var.mySubnetID
  
  associate_public_ip_address = true
  key_name = var.myKeyName

  tags = {
    Name = "cicd"
  }
}

resource "aws_security_group" "default_sg" {
  name        = "default_sg"
  vpc_id      = var.myVPCID

  ingress {
    from_port        = 5000
    to_port          = 5000
    protocol         = "tcp"
    cidr_blocks      = [var.myIP]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.myIP]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_security_group" "cicd_sg" {
  name        = "cicd_sg"
  vpc_id      = var.myVPCID

  ingress {
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = [var.myIP]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.myIP]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}