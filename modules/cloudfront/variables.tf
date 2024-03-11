variable "bucket_name" {
  type = string
}
variable "tag" {
  type =string
}
variable "bucket_regional_domain_name" {
  type = string
}

variable "ssl_certificate_arn" {
  type=string
}

variable "cname" {
  type=list
  description= "Alternate domain name"
}

variable "aws_region" {
  type=string
  description = "The AWS region to create things in."
}
