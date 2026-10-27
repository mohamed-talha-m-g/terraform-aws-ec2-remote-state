terraform {
  backend "s3" {
    key     = "ec2-remote-state/terraform.tfstate"
    encrypt = true
  }
}