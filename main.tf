terraform {
  backend "s3" {
    bucket                  = "task-station-terraform-state"
    key                     = "#{TAG}#/terraform.tfstate"
    region                  = "ap-south-1"
    encrypt                 = true
  }
}

provider "aws" {
  region                  = "ap-south-1"
}