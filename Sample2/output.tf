output "s3_bucket_name" {
value ="${data.terraform_remote_state.trs.s3_bucket_designed}"
  // s3_bucket_designed is the name of my bucket in project Sameple1
}

