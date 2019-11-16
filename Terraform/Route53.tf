resource "aws_route53_zone" "git_legion_dev" {
name          = "git-legion.dev."
#force_destroy = false
}


resource "aws_route53_record" "cname_route53_record" {
  zone_id = "${aws_route53_zone.git_legion_dev.zone_id}"
  name    = "_a78c3e516de1506a2eed484bce1dba46.git-legion.dev." # Replace with your subdomain, Note: not valid with "apex" domains, e.g. example.com
  type    = "CNAME"
  ttl     = "60"
  records = ["_987969fc5a234fce960168461ba58c10.olprtlswtu.acm-validations.aws"]
}

resource "aws_route53_record" "cname_route53_record2" {
  zone_id = "${aws_route53_zone.git_legion_dev.zone_id}"
  name    = "_a36d29edf4e0eba202322986ddc8150f.www.git-legion.dev." # Replace with your subdomain, Note: not valid with "apex" domains, e.g. example.com
  type    = "CNAME"
  ttl     = "60"
  records = ["_75e57818165d18dc7652e5e4a03b1504.kirrbxfjtw.acm-validations.aws."]
}


resource "aws_route53_record" "www" {
  zone_id = "${aws_route53_zone.git_legion_dev.zone_id}"
  name    = "git-legion.dev"
  type    = "A"

  alias {
    name                   = "${aws_alb.webapp_load_balancer.dns_name}"
    zone_id                = "${aws_alb.webapp_load_balancer.zone_id}"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "real_www" {
  zone_id = "${aws_route53_zone.git_legion_dev.zone_id}"
  name    = "www.git-legion.dev"
  type    = "A"

  alias {
    name                   = "${aws_alb.webapp_load_balancer.dns_name}"
    zone_id                = "${aws_alb.webapp_load_balancer.zone_id}"
    evaluate_target_health = true
  }
}
