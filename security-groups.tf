# Define the security group for the EC2 Instance
resource "aws_security_group" "vm-sg" {
  name        = "vm-sg"
  description = "Allowing incoming connections"
  vpc_id      = aws_vpc.primary_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow incoming HTTP connections"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow incoming SSH HTTP connections"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" #all
    cidr_blocks = ["0.0.0.0/0"]
  }
}