resource "aws_instance" "fastapi" {
  ami                         = var.aws_ami
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.ec2_key_pair.key_name
  vpc_security_group_ids      = [aws_security_group.api_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "${var.project_name}-${var.environment}-instance"
  }
}

output "public_ip" {
  value       = aws_instance.fastapi.public_ip
  description = "Public IP address of the FastAPI instance"
}
