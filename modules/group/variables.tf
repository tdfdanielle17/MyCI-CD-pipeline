variable "group_name" {
  description = "the name of user group to be created"
  type        = string
}
variable "managed_policies_to_attach" {
  description = "list of AWS managed arns to attached to the user group"
  type        = list(any)
  default     = []
}
variable "inline_policy_to_attach" {
  description = "json of inline policy to attach to the user group"
  type        = string
  default     = null
}

variable "policy_name" {
  description = "name to be given to inline policy created"
  type        = string
  default     = null

}

variable "policy_description" {
  type    = string
  default = null
}

variable "region" {
  type = string
}

