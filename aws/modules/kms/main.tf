resource "aws_kms_key" "main" {
  description             = var.description
  enable_key_rotation     = var.auto_rotate
  deletion_window_in_days = var.deletion_window_in_days

  policy = var.policy
}

resource "aws_kms_alias" "main" {
  name          = "alias/${var.alias}"
  target_key_id = aws_kms_key.main.id
}
