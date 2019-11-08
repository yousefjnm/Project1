resource "aws_iam_role_policy" "lambda_policy" {
  name = "lambda_policy"
  role = "${aws_iam_role.lambda_role.id}"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
			"Sid": "VisualEditor0",
			"Effect": "Allow",
			"Action": [
				"ec2:DescribeInstances",
				"ec2:StartInstances",
				"logs:*",
				"ec2:StopInstances"
			],
			"Resource": "*"
    }
  ]
}
EOF
}

  #policy = "${file("lambda-policy.json")}"

  


resource "aws_iam_role" "lambda_role" {
  name = "lambda4_role"

  assume_role_policy = "${file("lambda-assume-policy.json")}"
  
}
