resource "aws_s3_bucket" "website" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_policy" "website" {
  bucket     = aws_s3_bucket.website.id
  policy     = data.aws_iam_policy_document.website_policy.json
}

resource "aws_s3_bucket_acl" "website" {
  bucket     = aws_s3_bucket.website.id
  acl        = "private"
  depends_on = [aws_s3_bucket_ownership_controls.s3_bucket_acl_ownership]
}

resource "aws_s3_bucket_ownership_controls" "s3_bucket_acl_ownership" {
  bucket = aws_s3_bucket.website.id

  rule {
    object_ownership = "ObjectWriter"
  }
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.website.id

  index_document {
    suffix = var.index_html
  }

  error_document {
    key = var.error_html
  }

  routing_rules = <<ROUTING_RULES
  [
      {
          "Condition": {
              "HttpErrorCodeReturnedEquals": "404"
          },
          "Redirect": {
              "HostName": "${var.domain_name}",
              "ReplaceKeyPrefixWith": "#!/"
          }
      },
      {
          "Condition": {
              "HttpErrorCodeReturnedEquals": "403"
          },
          "Redirect": {
              "HostName": "${var.domain_name}",
              "ReplaceKeyPrefixWith": "#!/"
          }
      }
  ]
  ROUTING_RULES
}
