module "it_support" {
  source = "../..//modules/group"

  group_name              = "it_support"
  region                  = "us-east-1"
  policy_name             = "it-support-managed-policies"
  policy_description      = "groupc_it_support_policies"
  inline_policy_to_attach = data.aws_iam_policy_document.it_support_inline_policy.json
  managed_policies_to_attach = [
    "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess",
    "arn:aws:iam::aws:policy/AdministratorAccess"
  ]

}

data "aws_iam_policy_document" "it_support_inline_policy" {
  statement {
    sid = ""
    actions = [
      "cloudtrail:*",
      "cloudwatch:*"
    ]
    resources = ["*"]
  }
  statement {
    sid = ""
    actions = [
      "ec2:*",
      "s3:*"
    ]
    resources = ["*"]
  }
}
