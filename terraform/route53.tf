resource "aws_route53_zone" "myZone" {
  name = "example.com"
}

resource "aws_route53_record" "myRecord" {
  zone_id = aws_route53_zone.myZone.zone_id
  name    = "example.com"
  type    = "A"

  alias {
      name                   = aws_lb.production.dns_name
      zone_id                = aws_lb.production.zone_id
      evaluate_target_health = true
  }
}