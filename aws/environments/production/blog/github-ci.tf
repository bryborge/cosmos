resource "aws_iam_user" "blog_gh_cicd" {
  name = "blog_gh_cicd"
}

resource "aws_iam_access_key" "blog_gh_cicd" {
  user = aws_iam_user.blog_gh_cicd.name
}

resource "aws_iam_user_policy" "blog_gh_cicd" {
  name   = "blog_gh_cicd_user_policy"
  user   = aws_iam_user.blog_gh_cicd.name
  policy = data.aws_iam_policy_document.blog_gh_cicd.json
}
