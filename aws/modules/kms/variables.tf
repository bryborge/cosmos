variable "alias" {
  type        = string
  description = "The name of the KMS key alias."
}

variable "description" {
  type        = string
  default     = ""
  description = "The KMS key description."
}

variable "auto_rotate" {
  type        = bool
  default     = true
  description = "Whether to enable automatic KMS key rotation. Defaults to true."
}

variable "deletion_window_in_days" {
  type        = number
  default     = 10
  description = "Duration (in days) to wait before deleting a key that is scheduled for deletion. Defaults to 10 days."
}

// Note:
//   All KMS keys must have a key policy. If a key policy is not specified, AWS gives the KMS key a default key policy
//   that gives all principals in the owning account unlimited access to all KMS operations for the key. This default
//   key policy effectively delegates all access control to IAM policies and KMS grants.
//    - Link: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key#argument-reference
//    - Link: https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default
variable "policy" {
  type        = string
  default     = null
  description = "A valid policy JSON document to attach to the key."
}
