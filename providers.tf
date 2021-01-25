terraform {
  required_version = ">= 0.13"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    cloudflare = {
      source = "terraform-providers/cloudflare"
    }
    }
  }

provider "aws" {
	region = var.region
	access_key = var.access_key
	secret_key = var.secret_key
}

provider "cloudflare" {
	api_token = var.APItoken
}	
