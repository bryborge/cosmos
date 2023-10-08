data "aws_iam_policy_document" "website_policy" {
  statement {
    actions = [
      "s3:GetObject",
      "s3:ListBucket"
    ]

    principals {
      identifiers = [aws_cloudfront_origin_access_identity.oai.iam_arn]
      type        = "AWS"
    }

    resources = [
      "arn:aws:s3:::${var.domain_name}/*",
      "arn:aws:s3:::${var.domain_name}"
    ]
  }
}
