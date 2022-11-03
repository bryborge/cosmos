locals {
  session_user          = "ephemeral"
  session_user_password = "password"
}

variable "user_password" {
  type        = string
  description = "the primary user password"
}

variable "user_salt" {
  type        = string
  description = "the primary user password salt"
}
