resource "aws_iam_user" "my_users" {
  for_each = local.users
  name     = each.key
}

resource "aws_iam_user_policy_attachment" "my_users_policy" {
  for_each   = local.users
  user       = aws_iam_user.my_users[each.key].name
  policy_arn = each.value

}

resource "aws_iam_group" "my_groups_c" {
  for_each = local.managed_policies
  name     = "each.key"

}

resource "aws_iam_group_policy_attachment" "group_attachment" {
  for_each   = local.managed_policies
  group      = aws_iam_group.my_groups_c[each.key].name
  policy_arn = each.value
}


resource "aws_iam_group_policy" "group_inline_policy" {
  for_each = local.inline_policies
  name     = ${each.key} - policies
  group    = aws_iam_group.my_groups[each.key].name
  policy   = each.value

}
