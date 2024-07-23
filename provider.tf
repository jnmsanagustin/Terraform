provider "aws" {
    region     = "ap-southeast-1"
    access_key = ""
    secret_key = ""
}

terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "6.2.3"
    }
  }
}

provider "github" {
  token = ""
}