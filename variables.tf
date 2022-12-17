#********CREDS********
#*********************
variable "region" {
  type = string
  default = "eu-central-1"
}

variable "access_key" {
  type = string
  description = "aws access key"
}

variable "secret_key" {
  type = string
  description = "aws secret key"
}

#********Networking-variables section********
#********************************************
# AWS AZ
variable "aws_az" {
  type        = string
  description = "AWS AZ"
  default     = "eu-central-1a"
}

# VPC Variables
variable "vpc_cidr" {
  type        = string
  description = "CIDR for the VPC"
  default     = "10.10.20.0/26"
}

# Subnet Variables
variable "public_subnet_cidr" {
  type        = string
  description = "CIDR for the public subnet"
  default     = "10.10.20.0/28"
}

# SSH key path 
variable "ssh_key_path" {
  description = "local path to public ssh-key"
  default     = "~/.ssh/deploy.pub"
}

variable "priv_ssh-key_path" {
  default = "~/.ssh/deploy"

}

#********VM-variables section********
#************************************
variable "vm_instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "vm-ami" {
  type        = string
  description = "vm ec2 instance ami"
  #  default     = "ami-06ce824c157700cd2"
  default = "ami-0af6bb52ea735ac55"
}
