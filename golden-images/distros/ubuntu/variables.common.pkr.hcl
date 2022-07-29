locals {
  session_user          = "ubuntu"
  session_user_password = "ubuntu"
}

variable "primary_user_password" {
  type        = string
  description = "the primary user password"
}
