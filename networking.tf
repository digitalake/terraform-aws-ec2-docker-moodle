resource "aws_vpc" "primary_vpc" {
    cidr_block = "10.10.20.0/26"
    enable_dns_support = true
    enable_dns_hostnames = true
}

resource "aws_subnet" "priv_sub_2a" {
    vpc_id = aws_vpc.primary_vpc.id
    cidr_block = "10.10.20.0/28"
    availability_zone = "us-east-2a"  
}

resource "aws_subnet" "priv_sub_2b" {
    vpc_id = aws_vpc.primary_vpc.id
    cidr_block = "10.10.20.16/28"
    availability_zone = "us-east-2b"  
}

resource "aws_subnet" "priv_sub_2c" {
    vpc_id = aws_vpc.primary_vpc.id
    cidr_block = "10.10.20.32/28"
    avaiavailability_zone = "us-east-2c" 
}