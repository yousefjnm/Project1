terraform {
    backend  "s3" {
    region         = "us-west-2"
    bucket         = "gitlegionbucket"
    key            = "ec2/terraform.tfstate"
    dynamodb_table = "tf-state-lock"
    }
}

resource "aws_default_vpc" "default" {}

resource "aws_instance" "bastion" {
  ami                         = "ami-969ab1f6"
  key_name                    = "newInstanceKey"
  instance_type               = "t2.micro"
  security_groups             = ["${aws_security_group.bastion-sg.id}"]
  associate_public_ip_address = true
}

resource "aws_security_group" "bastion-sg" {
  name   = "bastion-security-group"
  vpc_id = "${aws_default_vpc.default.id}"

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}


output "bastion_public_ip" {
  value = "${aws_instance.bastion.public_ip}"
}
