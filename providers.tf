terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=4.20.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "2.2.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  assume_role_with_web_identity {
    # role_arn = "arn:aws:iam::042670738437:role/rol-terraform-github"
    # web_identity_token = ""
  }
}