provider "aws" {
  profile       = "default"
  region        = "us-west-2"
}

resource "aws_alb" "webapp_load_balancer" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.elb_security_group.id}"]
  subnets            = ["subnet-0272634f5cdc4c886", "subnet-04f078b91b5bd1841"]
  #depends_on         = ["aws_subnet.public_subnets",   "aws_security_group.elb_security_group"]

  enable_deletion_protection = true



  tags = {
    Name = "webapp_load_balancer_Tf"
  }
}



#creating security group
resource "aws_security_group" "elb_security_group" {
  name = "ELB-SG"
  description = "ELB Security Group"
  #vpc_id = "${aws_vpc.mainvpc.id}"  ########this is the vpc
 
  ingress {
    from_port = 80
    protocol  = "tcp"
    to_port   = 80
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow web traffic to load balancer"
  }


  egress {
    from_port = 0 
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
     Name ="elb_security_group"
  }
}




##create target group
resource "aws_alb_target_group" "alb_front_http" {
  name = "alb-front-http"
  vpc_id = "vpc-d1098ba9"     #####This is our vpc
  port = "80"
  protocol  = "HTTP"
  health_check {
	path = "/"
	port = "80"
	protocol = "HTTP"
	healthy_threshold = 5
	unhealthy_threshold = 2
	interval = 5
	timeout = 4
	matcher = "200"
    }
  tags = {
    Name = "alb_front_http_Tf"
  }
  #depend_on = ["aws_vpc.mainvpc"]]   ###this is our vpc
}




resource "aws_alb_target_group_attachment" "targetgroup_alb" {
  target_group_arn = "${aws_alb_target_group.alb_front_http.arn}"
  #count = "${length(var.public_subnet_cidr)}"
  port = 80
  target_id = "i-007d4f45a6587495e"
}




#create a listener
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = "${aws_alb.webapp_load_balancer.arn}"
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:acm:us-west-2:342283246872:certificate/2d42e477-8ff9-40b2-b0cf-c118e94cc339"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.alb_front_http.arn}"
  }
}




resource "aws_lb_listener" "front_end2" {
  load_balancer_arn = "${aws_alb.webapp_load_balancer.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
  depends_on = ["aws_alb.webapp_load_balancer", "aws_alb_target_group.alb_front_http"]
}