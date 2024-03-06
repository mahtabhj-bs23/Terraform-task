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