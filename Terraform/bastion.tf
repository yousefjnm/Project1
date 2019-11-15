resource "aws_instance" "bastion" {
  ami                         = "ami-06d51e91cea0dac8d"
  key_name                    = "newInstanceKey"
  instance_type               = "t2.micro"
  security_groups             = ["${aws_security_group.bastion-sg.name}"]
  associate_public_ip_address = true
  tags = {
  Type = "Scheduled"
  }
 }

resource "aws_security_group" "bastion-sg" {
  name   = "bastion-security-group"
  vpc_id = "${aws_vpc.VPC_Official.id}"

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
