module "my_org" {
  source = "../..//modules/aws_organization"
  region = "us-east-1"
  feature_org = "ALL"
  policy_content = 
  type_of_policy = ["SERVICE_CONTROL_POLICY"]
  create_ou = "dev_ou"
  name_ec2_policy = "Deny-ec2-public-subnet"
  name_policy_iam = "Block-am-policy-with-no-ag"
  iam_policy_content_json= data.aws_iam_policy_document.deny_iam_user_without_tags.json
  ec2_policy_content_json = data.aws_iam_policy_document.deny_public_subnet_ec2.json
}


data "aws_iam_policy_document" "deny_iam_user_without_tags" {
  statement {
    sid    = "DenyIAMUserWithoutTags"
    effect = "Deny"
    actions = [
      "iam:CreateUser"
    ]
    resources = ["*"]

    condition {
      test     = "Null"
      variable = "aws:RequestTag/CostCenter"
      values = ["true"]
    }
  }
}

data "aws_iam_policy_document" "deny_ec2_public_subnet" {
  statement {
    sid    = "DenyEC2InPublicSubnet"
    effect = "Deny"
    actions = [
      "ec2:RunInstances"
    ]
    resources = ["*"]

    condition {
      test     = "StringEquals"
      variable = "ec2:CreateAction"
      values = ["ec2:RunInstances"]
    }

    condition {
      test     = "ArnEquals"
      variable = "ec2:Subnet"
      values = ["arn:aws:ec2:::subnet/*"]
    }
  }
}

