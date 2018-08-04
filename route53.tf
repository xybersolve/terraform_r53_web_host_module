#
# Create web host
#
resource "aws_route53_zone" "this" {
   name = "${var.host_domain}"

  tags {
    Environment = "${var.environment}"
    Application = "${var.application}"
    Terraform = "True"
  }
}

locals {
   host_zone_id = "${aws_route53_zone.this.zone_id}"
}

resource "aws_route53_record" "ns" {
  zone_id = "${local.host_zone_id}"
  name    = "${var.host_domain}"
  type    = "NS"
  ttl     = "30"

  records = [
    "${aws_route53_zone.this.name_servers.0}",
    "${aws_route53_zone.this.name_servers.1}",
    "${aws_route53_zone.this.name_servers.2}",
    "${aws_route53_zone.this.name_servers.3}",
  ]
}

resource "aws_route53_record" "site" {
   name = "${var.host_domain}"
   zone_id = "${local.host_zone_id}"
   ttl = "${var.ttl}"
   type = "A"
   records = ["${var.public_ip}"]
   # alias {
   #   name        = "${var.public_dns}"
   #   zone_id     = "${local.host_zone_id}"
   #   evaluate_target_health = true
   # }
}

resource "aws_route53_record" "www-site" {
   name = "www.${var.host_domain}"
   zone_id = "${local.host_zone_id}"
   ttl = "${var.ttl}"
   type = "A"
   records = ["${var.public_ip}"]
   # alias {
   #   name        = "${var.public_dns}"
   #   zone_id     = "${local.host_zone_id}"
   #   evaluate_target_health = true
   # }
   #
}
