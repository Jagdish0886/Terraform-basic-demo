provider "aws" {
  region = "ap-south-1"
}

terraform {
  backend "s3" {
    region = "ap-south-1"
    bucket = "terraform-tuts-sapient"
    key = "datasource/test"
  }
}

data "terraform_remote_state" "trs" {
  backend   = "s3"
  config    = {
    region        = "${var.region}"
    key           = "${var.remote_state_key}"
    bucket        = "${var.remote_state_bucket}"
  }
}