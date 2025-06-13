terraform {
  backend "s3" {
    bucket = "hcltrainings"
    key    = "terraform.tfstate"
    region = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}

terraform {
  required_version = ">= 1.12.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}