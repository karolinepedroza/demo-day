resource "tls_private_key" "rsa_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ec2_key_pair" {
  key_name   = "ec2-instance-key"
  public_key = tls_private_key.rsa_key.public_key_openssh

  tags = {
    Name = "${var.project_name}-${var.environment}-key"
  }
}

resource "local_file" "private_key_pem" {
  content         = tls_private_key.rsa_key.private_key_pem
  filename        = "ec2-instance-key.pem"
  file_permission = "0400"
}
