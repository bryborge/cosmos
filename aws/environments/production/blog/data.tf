data "aws_iam_policy_document" "cicd_deployer" {
  statement {
    actions = [
      "s3:*",
      "cloudfront:CreateInvalidation",
      "cloudfront:GetDistribution",
    ]

    resources = [
      "arn:aws:s3:::${var.bucket_name}/*",
      "arn:aws:s3:::${var.bucket_name}",
      "arn:aws:cloudfront::${var.aws_account_id}:distribution/${var.cloudfront_dist_id}",
    ]
  }
}
