# Security Group consolidado para o servidor web
resource "aws_security_group" "api_sg" {
  name_prefix = "${var.project_name}-${var.environment}-"
  description = "Autoriza acesso SSH"


  # Regra de entrada (Ingress) para HTTP (porta 80) de qualquer origem
  ingress {
    description = "SSH from my IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.meu_ip_publico]
  }

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.project_name}-${var.environment}-api-sg"
  }
}