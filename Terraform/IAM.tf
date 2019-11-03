
terraform {
    backend  "s3" {
    region         = "us-west-2"
    bucket         = "gitlegionbucket"
    key            = "ec2/terraform.tfstate" 
    dynamodb_table = "tf-state-lock"
    }
} 
variable "Stop_ec2" {
  type = "string"
}
data "aws_lambda_function" "existing" {
  function_name = "${var.Stop_ec2}"
}
variable "start_stop_EC2" {
  type = "string"
}
data "aws_lambda_function" "existing" {
  function_name = "${var.start_stop_EC2}"
}
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
