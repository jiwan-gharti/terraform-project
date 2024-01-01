terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

data "aws_vpc" "default_vpc" {
    default = true
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_inbound_outbound_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = data.aws_vpc.default_vpc.id

  tags = {
    Name = "allow_tls"
  }
}