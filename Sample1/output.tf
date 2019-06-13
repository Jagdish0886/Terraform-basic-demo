output "s3_bucket_designed" {
  value = "${aws_s3_bucket.main.bucket}"
}
output "s3_bucket_domain" {
  value = "${aws_s3_bucket.main.bucket_domain_name}"
}