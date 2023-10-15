resource "aws_s3_bucket" "website" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_policy" "website" {
  bucket     = aws_s3_bucket.website.id
  policy     = data.aws_iam_policy_document.website_policy.json
  depends_on = [aws_s3_bucket_public_access_block.website]
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.website.id

  index_document {
    suffix = var.index_html
  }

  error_document {
    key = var.error_html
  }
}

resource "aws_s3_bucket_acl" "website" {
  bucket     = aws_s3_bucket.website.id
  acl        = "public-read"
  depends_on = [aws_s3_bucket_ownership_controls.s3_bucket_acl_ownership]
}

resource "aws_s3_bucket_ownership_controls" "s3_bucket_acl_ownership" {
  bucket = aws_s3_bucket.website.id

  rule {
    object_ownership = "ObjectWriter"
  }

  depends_on = [aws_s3_bucket_public_access_block.website]
}

resource "aws_s3_bucket_policy" "website" {
  bucket     = aws_s3_bucket.website.id
  policy     = data.aws_iam_policy_document.website_policy.json
  depends_on = [aws_s3_bucket_public_access_block.website]
}

resource "aws_s3_bucket_public_access_block" "website" {
  bucket = aws_s3_bucket.website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.website.id

  index_document {
    suffix = var.index_html
  }

  error_document {
    key = var.error_html
  }
}
