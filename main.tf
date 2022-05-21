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
  profile = "default"
  region  = "eu-central-1"
}


data "aws_caller_identity" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
}




resource "aws_s3_bucket" "xw-cloudtask-hartmann-arno" {
  bucket = "xw-cloudtask-hartmann-arno"
}

resource "aws_s3_bucket_cors_configuration" "xw-cloudtask-hartmann-arno_cors" {
  bucket = aws_s3_bucket.xw-cloudtask-hartmann-arno.bucket

    cors_rule {
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
  }
}

resource "aws_s3_bucket_acl" "xw-cloudtask-hartmann-arno_acl" {
  bucket = aws_s3_bucket.xw-cloudtask-hartmann-arno.id
  acl    = "private"
}