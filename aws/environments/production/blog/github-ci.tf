resource "aws_iam_user" "cicd_deployer" {
  name = "cicd_deployer"
}

resource "aws_iam_access_key" "cicd_deployer" {
  user = aws_iam_user.cicd_deployer.name
}

resource "aws_iam_user_policy" "cicd_deployer" {
  name   = "cicd_deployer_user_policy"
  user   = aws_iam_user.cicd_deployer.name
  policy = data.aws_iam_policy_document.cicd_deployer.json
}
