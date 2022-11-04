locals {
  session_user          = "packer"
  session_user_password = "packer"
}

variable "user_password" {
  type        = string
  description = "the primary user password"
}

variable "user_salt" {
  type        = string
  description = "the primary user password salt"
}
