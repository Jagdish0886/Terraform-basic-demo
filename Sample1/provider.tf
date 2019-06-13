provider "aws" {
region = "${var.s3_region}"
}
terraform {
  backend "s3" {
    bucket  = "terraform-tuts-sapient"
    key     = "sample/statedata.tfstate"
    region  = "ap-south-1"
    encrypt = "true"
  }
}
