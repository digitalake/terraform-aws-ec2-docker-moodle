resource "aws_instance" "ec2" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type

  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [aws_security_group.ec2_security_group.id]
  associate_public_ip_address = true

  key_name = aws_key_pair.ec2_key_pair.key_name

  tags = {
    Name = var.ec2_name
  }
}
