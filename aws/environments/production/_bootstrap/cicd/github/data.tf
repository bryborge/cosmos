data "aws_iam_policy_document" "aws_assume_role" {
  statement {
    effect  = "Allow"
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.aws_account_id}:root"]
    }
  }
}

data "aws_iam_policy_document" "github_cicd" {
  statement {
    effect  = "Allow"
    actions = [
      "sts:AssumeRole"
    ]
    resources = [
      aws_iam_role.pipeline.arn,
    ]
  }
}


# data "aws_iam_policy_document" "github_cicd_role" {
#   statement {
#     actions = [
#       "s3:*",
#       "cloudfront:CreateInvalidation",
#       "cloudfront:GetDistribution",
#     ]

#     resources = [
#       "arn:aws:s3:::${var.bucket_name}/*",
#       "arn:aws:s3:::${var.bucket_name}",
#       "arn:aws:cloudfront::${var.aws_account_id}:distribution/${var.cloudfront_dist_id}",
#     ]
#   }
# }
