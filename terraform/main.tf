terraform {
  required_version = ">= 0.15.0"

  backend "s3" {
    bucket  = "terraform-s3-remote-state-bucket"
    key     = "terraform/state"
    region  = "us-east-1"
    encrypt = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~>2.2"
    }
  }
}
