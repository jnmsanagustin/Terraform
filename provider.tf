provider "aws" {
    region     = "ap-southeast-1"
}

terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "6.2.3"
    }
  }
}