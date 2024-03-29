resource "aws_instance" "WebSrvr1" {
  ami           = "ami-06d51e91cea0dac8d"
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.private_1.id}"
  security_groups = ["${aws_security_group.WebSrvrSG.id}"]
  associate_public_ip_address  = true
  key_name      = "newInstanceKey"

  tags = {
    Name = "WebSrvr1"
    Type = "Scheduled"
  }
}

resource "aws_instance" "WebSrvr2" {
  ami           = "ami-06d51e91cea0dac8d"
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.private_1.id}"
  security_groups = ["${aws_security_group.WebSrvrSG.id}"]
  associate_public_ip_address  = true
  key_name      = "newInstanceKey"

  tags = {
    Name = "WebSrvr2"
    Type = "Scheduled"
  }
}

#Creating Security Group
resource "aws_security_group" "WebSrvrSG" {
  vpc_id  = "${aws_vpc.VPC_Official.id}"
  name = "WebSrvrSG"
  description = "WebServerSecurityGroup"
  
  ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow All Traffic to port 80"
    }
     
   ingress {
    from_port = 443
    protocol = "tcp"
    to_port = 443
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow All Traffic to port 443"
    }
    
   ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow All Traffic to port 443"
    }
    
   egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }    
}
