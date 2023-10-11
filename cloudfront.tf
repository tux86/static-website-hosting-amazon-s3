resource "aws_cloudfront_distribution" "root_s3_distribution" {

  origin {
    domain_name = aws_s3_bucket_website_configuration.website_bucket.website_endpoint
    origin_id   = aws_s3_bucket.website_bucket.bucket_regional_domain_name

    # https://stackoverflow.com/a/55042824/4198382
    custom_origin_config {
      http_port                = 80
      https_port               = 443
      origin_keepalive_timeout = 5
      origin_read_timeout      = 30
      origin_protocol_policy   = "http-only"
      origin_ssl_protocols     = ["TLSv1.2"]
    }
  }

  comment         = "CloudFront distribution for ${var.bucket_name}"
  enabled         = true
  is_ipv6_enabled = true
  http_version    = "http2and3"

  aliases = [
    var.domain_name,
    "www.${var.bucket_name}"
  ]

  default_root_object = "index.html"

  default_cache_behavior {
    cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods         = ["GET", "HEAD"]
    compress               = true
    target_origin_id       = aws_s3_bucket.website_bucket.bucket_regional_domain_name

    function_association {
      event_type   = "viewer-request"
      function_arn = aws_cloudfront_function.www_redirect.arn
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = []
    }
  }

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate_validation.cert_validation.certificate_arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }

  tags = var.common_tags
}

/*
  A CloudFront function to redirect www-prefixed URLs to the apex domain,
  enhancing user experience and consolidating domain authority.
*/
resource "aws_cloudfront_function" "www_redirect" {
  name    = "${local.prefix}-www-redirect"
  runtime = "cloudfront-js-1.0"
  code    = file("./cloudfront-function.js")
  publish = true
}
