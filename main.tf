terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami                    = "ami-033b95fb8079dc481"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-0bfd7b52aea18d893"]
  subnet_id              = "subnet-033268c5a367b009a"

  tags = {
    Name = var.instance_name
  }
}
