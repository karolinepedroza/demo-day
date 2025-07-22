# Security Group consolidado para o servidor web
resource "aws_security_group" "api-sg-ssh" {
  name        = "api-sg"
  description = "Autoriza acesso SSH"


  # Regra de entrada (Ingress) para HTTP (porta 80) de qualquer origem
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}