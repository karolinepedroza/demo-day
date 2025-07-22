resource "aws_instance" "fastapi" {
  ami                         = "ami-0150ccaf51ab55a51"
  instance_type               = "t2.micro"
  key_name = aws_key_pair.ec2_key_pair.key_name
  vpc_security_group_ids      = [aws_security_group.api-sg-ssh.id]
  associate_public_ip_address = true

  tags = {
    Name = "fastapi-instance"
  }
}


output "public_ip" {
  value = aws_instance.fastapi.public_ip
}

