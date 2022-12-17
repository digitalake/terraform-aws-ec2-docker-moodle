terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.46.0"
    }
  }
}

provider "aws" {
#do not pass aws keys right in provider section 
#use env vars(export VARNAME=value) or aws credentials file via "aws configure command" (~/.aws/config)
}