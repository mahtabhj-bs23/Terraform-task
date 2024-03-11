variable "region" {
  type    = string
  default = "#{AWS_REGION}#"
}

variable "tag" {
  type    = string
  default = "#{TAG}#"
}

variable "account" {
  type    = string
  default = "#{AWS_ACCOUNT}#"
}

variable "image_tag" {
  type    = string
  default = "#{IMAGE_TAG}#"
}

variable "pg_name" {
  type = string
  default = "#{PG_NAME}#"
}
variable "pg_password" {
  type = string
  default = "#{PG_PASSWORD}#"
}
variable "pg_user" {
  type = string
  default = "#{PG_USER}#"
}

variable "alb_acm_certificate_arn" {
  type = string
  default = "#{ACM_CERTIFICATE_ARN}#"
}

variable "alb_domain_name" {
  type = string
  default = "#{ALB_DOMAIN_NAME}#"
}

variable "clodfront_acm_certificate_arn" {
  type = string
  default = "#{CLOUDFRONT_CERTIFICATE_ARN}#"
}

variable "cloudfront_domain_name" {
  type = string
  default = "#{CLOUDFRONT_DOMAIN_NAME}#"
}