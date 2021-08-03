#Based on https://learn.hashicorp.com/tutorials/terraform/aws-build?in=terraform/aws-get-started
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  # no cred data to get credentials from env varaables (export...)
  # or
  # use default credentials from aws client  
  #profile = "default"
  # or 
  # set up it manual
  # access_key = ""
  # secret_key = ""
  region = "us-east-1"
}
