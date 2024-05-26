locals {
  users = {
    "james" = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess",
    "kenny" = "arn:aws:iam::aws:policy/AdministratorAccess",
    "paul"  = "arn:aws:iam::aws:policy/AdministratorAccess",
    "kiki"  = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  }

}
locals {
  managed_policies = {
    security   = "arn:aws:iam::aws:policy/AdministratorAccess",
    devops     = "arn:aws:iam::aws:policy/AdministratorAccess",
    compliance = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  }
  inline_policies = {
    security = jsonencode({
      version = "2010-10-17"
      statement = [
        {
          Effect   = "Allow"
          Action   = "ec2:*"
          Resource = "*"
        }
      ]
    })

    devops = jsonencode({
      version = "2012-10-17"
      statement = [
        {
          Effect   = "Allow"
          Action   = "s3:*"
          Resource = "*"
        }

      ]

    })

    compliance = jsonencode({
      version = "2012-10-17"
      statement = [
        {
          Effect   = "Allow"
          Action   = "cloudtrail:*"
          Resource = "*"
        }
      ]

    })
  }


}
