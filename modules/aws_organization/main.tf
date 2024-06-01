resource "aws_organizations_organization" "my_org_root" {
  feature_set          = var.feature_org
  enabled_policy_types = var.type_of_policy
}

resource "aws_organizations_organizational_unit" "dev_ou" {
  name      = var.create_ou
  parent_id = aws_organizations_organization.my_org_root[0].id
}

resource "aws_organizations_policy" "deny_ec2_public_subnet" {
  name    = var.name_ec2_policy
  content = var.policy_content
}

resource "aws_organizations_policy" "deny_iam_policy_with_no_tag" {
  name    = var.name_policy_iam
  content = var.iam_policy_content_json
}

resource "aws_organizations_policy_attachment" "inline_policy_to_attach_unit" {
  policy_id = aws_organizations_policy.deny_ec2_public_subnet.id
  target_id = aws_organizations_organizational_unit.dev_ou.id
}

resource "aws_organizations_policy_attachment" "deny_iam_policy_to_attach_with_no_tag" {
  policy_id = aws_organizations_policy.deny_iam_policy_with_no_tag.id
  target_id = aws_organizations_organizational_unit.dev_ou.id
}
