variable "feature_org" {
  description = "the variable to define the set"
  type        = string
}

variable "type_of_policy" {
  description = " the type of otganization policy"
  type        = list(any)

}
variable "create_ou" {
  description = "name of organization unit"
  type        = string
}

variable "name_ec2_policy" {
  description = "policy to deny ec2 public subnet"
  type        = string
}
variable "policy_content" {
  description = " policy json"
  type        = string
}

variable "name_policy_iam" {
  description = " policy to deny iam with no tag"
  type        = string

}
variable "iam_policy_content_json" {
  description = " json policy to attach for iam without tag"
  type        = string

}  

variable "ec2_policy_content_json" {
  description = "json policy to attach to deny ec2 public subnet creation "  
}
variable "region" {
  type = string


}




