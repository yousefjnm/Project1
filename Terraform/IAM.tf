terraform {
    backend  "s3" {
    region         = "us-west-2"
    bucket         = "gitlegionbucket"
    key            = "ec2/terraform.tfstate"
    dynamodb_table = "tf-state-lock"
    }
}

resource "aws_iam_role" "lambdaRole" {
  name = "lambdaRole"

  assume_role_policy = <<EOF
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action": "sts:AssumeRole",
          "Principal": {
          "Service": "ec2.amazonaws.com"
          },
          "Effect": "Allow",
          "Sid": ""
        }
      ]
    }
EOF
}

resource "aws_iam_policy" "policy" {
  name        = "test-policy"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "ec2:Start*",
        "ec2:Stop*"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "attach-policies" {
  role       = "${aws_iam_role.lambdaRole.name}"
  policy_arn = "${aws_iam_policy.policy.arn}"
}
