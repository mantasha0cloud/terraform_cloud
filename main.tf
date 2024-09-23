terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.54.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.2"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "random_id" "rand_id" {
  byte_length = 10
}

resource "aws_s3_bucket" "mantu" {
  bucket = "mantu-${terraform.workspace}-${random_id.rand_id.hex}"
}
