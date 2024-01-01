variable "region" {
  default = "$var.region"
  type = string
  description = "region"
}

variable "access_key" {
    default = "$var.access_key"
    type = string
    description = "access_key"
}

variable "secret_key" {
    default = "$var.secret_key"
    type = string
    description = "secret_key"
}


variable "additional_ingress_rules" {
  default = {
    rule1 = {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    rule2 = {
      from_port   = 9000
      to_port     = 9000
      protocol    = "udp"
      cidr_blocks = ["10.0.0.0/16"]
    }
  }
}

