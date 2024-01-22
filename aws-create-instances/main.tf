terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
    region = var.region
}

locals {
    time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

variable "region" {
    default = "us-east-2"
}

variable "tags" {
    type = list
    default = ["first_instance","second_instance"]
}

variable "ami" {
    type = map
    default = {
        "us-east-2" = "ami-123456789"
        "us-east-1" = "ami-987654321"
        "us-west-1" = "ami-192837465"
    }
}

resource "aws_key_pair" "loginkey" {
    key_name = "login-key"
    public_key = file("${path.module}/id_rsa.pub")
}

resource "aws_instance" "app-dev" {
    ami = lookup(var.ami,var.region)
    instance_type = "t2.micro"
    key_name = aws_key_pair.loginkey.key_name
    count = 2

    tags = {
        Name = element(var.tags,count.index)
    }
}