output "arn" {
  value = aws_kms_key.main.arn
}

output "key_id" {
  value = aws_kms_key.main.arn
}

output "alias" {
  value = aws_kms_alias.main.name
}
