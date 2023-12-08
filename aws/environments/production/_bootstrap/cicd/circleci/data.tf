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

data "aws_iam_policy_document" "circleci_user" {
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
