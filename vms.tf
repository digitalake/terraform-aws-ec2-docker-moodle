data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_key_pair" "deploy" {
  key_name = "deploy"
  public_key = file("${var.ssh_key_path}")
}

resource "aws_instance" "ec2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.vm_instance_type

  subnet_id                   = aws_subnet.pub_sub.id
  vpc_security_group_ids      = [aws_security_group.vm-sg.id]
  associate_public_ip_address = true

  key_name = aws_key_pair.deploy.key_name

  tags = {
    Name = "ec2-vm"
  }
}
