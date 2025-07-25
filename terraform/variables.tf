variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region for resources"
}

variable "aws_ami" {
  type        = string
  default     = "ami-0150ccaf51ab55a51"
  description = "AMI ID for EC2 instance"

}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "EC2 instance type"

}

variable "project_name" {
  type        = string
  default     = "demo-day"
  description = "Project name for resource naming"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Environment (dev, staging, prod)"
}

variable "meu_ip_publico" {
  type        = string
  description = "Endereço IP público para o Security Group SSH"
  # IMPORTANTE: Substitua pelo seu endereço IP público
  # Para saber o seu IP público, acesse https://www.whatismyip.com/
  default = "179.218.152.127/32"
}
