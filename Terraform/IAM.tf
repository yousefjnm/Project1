terraform {
    backend  "s3" {
    region         = "us-west-2"
    bucket         = "gitlegionbucket"
    key            = "ec2/terraform.tfstate" 
    dynamodb_table = "tf-state-lock"
    }
} 

provider “aws” {
  region = “us-west-2”
}
resource "aws_iam_policy" "policy" {
  name        = "s3policy"
  description = "For lambda function accssesing S3"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::gitlegionbucket"
    }
  ]
}
EOF
}
