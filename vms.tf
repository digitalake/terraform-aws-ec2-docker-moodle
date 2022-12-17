#Creating SSH key resource for remote connections
resource "aws_key_pair" "deploy" {
  key_name   = "deploy"
  public_key = file("${var.ssh_key_path}")
}

#Uncomment lines down to use docker-dinstall script if using ami without pre-installed Docker
#data "template_file" "script" {
#  template = file("${path.module}/scripts/docker-spray.sh")
#}


resource "aws_instance" "ec2" {
  ami           = var.vm-ami
  instance_type = var.vm_instance_type

  subnet_id                   = aws_subnet.pub_sub.id
  vpc_security_group_ids      = [aws_security_group.vm-sg.id]
  associate_public_ip_address = true

  key_name  = aws_key_pair.deploy.key_name
#Uncomment lines down to use docker-dinstall script if using ami without pre-installed Docker
#  user_data = data.template_file.script.rendered

  tags = {
    Name = "ec2-vm"
  }
}

#Transporting docker-compose files + executing docker command to deploy moodle
resource "null_resource" "this" {

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${var.priv_ssh-key_path}")
    host        = aws_instance.ec2.public_ip
  }


  provisioner "file" {
    source      = "templates/docker-compose.yml"
    destination = "/home/ubuntu/docker-compose.yml"
  }

  provisioner "file" {
    source      = "compose-env/.env"
    destination = "/home/ubuntu/.env"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo docker-compose --env-file .env up -d"
    ]

  }
  triggers = {
    "res" = aws_instance.ec2.id
  }
}
