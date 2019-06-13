resource "aws_s3_bucket" "main" {
  bucket = "${var.s3_bucket_prefix}-${var.environment}-${var.s3_region}"
  acl = "private"

  #lifecycle {
  #  prevent_destroy = true
  #}

  versioning {
    enabled = true
  }

  lifecycle_rule {
    id = "log"
    enabled = true

    prefix = "log/"

    tags = {
      "rule" = "log"
      "autoclean" = "true"
    }

    transition {
      days = 30
      storage_class = "STANDARD_IA"
      # or "ONEZONE_IA"
    }

    transition {
      days = 60
      storage_class = "GLACIER"
    }

    expiration {
      days = 90
    }
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
      }
    }
  }
}

