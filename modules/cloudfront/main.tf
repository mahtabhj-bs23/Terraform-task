data "aws_cloudfront_cache_policy" "This" {
  name = "Managed-CachingOptimized"
}
module "cdn" {
  source = "terraform-aws-modules/cloudfront/aws"

  aliases = var.cname

  comment             = "task-station-${var.tag}-Cloudfront-for-frontend"
  enabled             = true
  is_ipv6_enabled     = true
  price_class         = "PriceClass_All"
  retain_on_delete    = false
  wait_for_deployment = false
  default_root_object = "index.html"

  create_origin_access_identity = true
  origin_access_identities = {
    s3_bucket_one = "cloudfront can access"
  }

  origin = {

    s3_one = {
      domain_name = var.bucket_regional_domain_name
      s3_origin_config = {
        origin_access_identity = "s3_bucket_one"
      }
      origin_shield = {
        enabled              = true
        origin_shield_region = var.aws_region
      }
    }
  }
  custom_error_response = [
    {
      "error_caching_min_ttl" = 300,
      "error_code"            = 400,
      "response_code"         = 200,
      "response_page_path"    = "/index.html",
    },
    {
      "error_caching_min_ttl" = 300,
      "error_code"            = 403,
      "response_code"         = 200,
      "response_page_path"    = "/index.html",
    },
    {
      "error_caching_min_ttl" = 300,
      "error_code"            = 404,
      "response_code"         = 200,
      "response_page_path"    = "/index.html",
    }
  ]

  default_cache_behavior       = {
    target_origin_id           = "s3_one"
    viewer_protocol_policy     = "redirect-to-https"
    allowed_methods            = ["GET", "HEAD", "OPTIONS"]
    cached_methods             = ["GET", "HEAD"]
    compress                   = true
    query_string               = true
    cache_policy_id            = data.aws_cloudfront_cache_policy.This.id
    use_forwarded_values       = false
  }

  geo_restriction = {
    restriction_type = "none"
  }

viewer_certificate = {
    #  "cloudfront_default_certificate": true,
    #  "minimum_protocol_version": "TLSv1"
    acm_certificate_arn      = var.ssl_certificate_arn
    minimum_protocol_version = "TLSv1.2_2021"
    ssl_support_method       = "sni-only"

  }
}

