variable "aws_region" {
  description = "The AWS region that the resources will reside in"
  type = string
  default = "us-east-2"
}

variable "aws_vpc_id" {
  description = "The AWS VPC ID for the subnet resources"
  type = string
  default = ""
}

variable "aws_subnet_cidr_block" {
  description = "The AWS subnet CIDR block"
  type = string
  default = "0.0.0.0/0"
}

variable "aws_subnet_ipv6_cidr_block" {
  description = "The AWS subnet CIDR block"
  type = string
  default = "::/0"
}

variable "aws_provider_credentials" {
  description = "The AWS shared credentials file"
  type = string
  default = "~/.aws/credentials"
}

variable "aws_provider_profile" {
  description = "The AWS credentials profile"
  type = string
  default = "default"
}

variable "name_tag_prefix" {
  description = "String prefix that uniquely identifies resources as part of the multi cloud solution"
  default = "dev_test"
}

variable "ingress_cidrs" {
  description = "The CIDR/network address space of the subnet for the primary GHE instance"
  default = ["10.0.0.0/24"]
}

variable "instance_type" {
  description = "The EC2 instance type that the primary GHE instance will run on"
  type = string
  default = "t3.micro"
}

variable "instance_count" {
  description = "How many instances do we want to provision?"
  type = string
  default = 1
}

variable "handle" {
  description = "GitHub Handle"
  type = string
  default = "octocat"
}

variable "ec2_key_pair_public_key" {
  description = "RSA public key of EC2 key pair used to access created instances"
  type = string
}

variable "ssh_private_key_path" {
  description = "Path to SSH private key used to access loadgens"
  type = string
  default = "../ssh-key.pem"
}
