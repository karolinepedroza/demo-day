variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "value of the region"
}

variable "aws_ami" {
  type        = string
  default     = "ami-0150ccaf51ab55a51"
  description = "value of the ami"

}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "value of the instance type"

}

variable "number_instances" {
  type        = number
  default     = 1
  description = "value of the number of instances"
}

variable "meu_ip_publico" {
  type        = string
  description = "Endereço IP público para o Security Group SSH"
  # IMPORTANTE: Substitua pelo seu endereço IP público
  # Para saber o seu IP público, acesse https://www.whatismyip.com/
  default = "179.218.152.127/32"
}
