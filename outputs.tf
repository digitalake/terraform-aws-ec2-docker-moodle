#Ec2 vm ip
output "ec2_ip" {
  value = aws_instance.ec2.public_ip
}