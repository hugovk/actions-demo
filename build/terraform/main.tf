provider "aws" {
  region = var.aws_region
}

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

  owners = ["099720109477"] # Canonical
}

resource "random_id" "random-suffix" {
  byte_length = 4
}

resource "aws_security_group" "github-demo-sg" {
  name = "github-demo-sg-${random_id.random-suffix.hex}"
  description = "Security group for demo instances."
  vpc_id = var.aws_vpc_id

  ingress {
    description      = "Allow SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [ var.aws_subnet_cidr_block ] # TODO determine GH Actions Runner IP and put it here
    ipv6_cidr_blocks = [ var.aws_subnet_ipv6_cidr_block ]
  }

  ingress {
    description      = "Allow HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [ var.aws_subnet_cidr_block ] # TODO determine GH Actions Runner IP and put it here
    ipv6_cidr_blocks = [ var.aws_subnet_ipv6_cidr_block ]
  }

  ingress {
    description      = "Allow HTTPS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [ var.aws_subnet_cidr_block ] # TODO determine GH Actions Runner IP and put it here
    ipv6_cidr_blocks = [ var.aws_subnet_ipv6_cidr_block ]
  }

  egress {
    description      = "Allow all outbound traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [ var.aws_subnet_cidr_block ]
    ipv6_cidr_blocks = [ var.aws_subnet_ipv6_cidr_block ]
  }
}

resource "aws_key_pair" "ec2-key-pair" {
  key_name = "github-demo-key-${random_id.random-suffix.hex}"
  public_key = var.ec2_key_pair_public_key
}
