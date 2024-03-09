variable "tag" {
  type        = string
}
variable "account" {
  type = string
}
variable "region" {
  type = string
}
variable "vpc_id" {
  type = string
}
variable "public_subnets" {
  type = list(string)
}
variable "alb_sg_id" {
  type = string
}
variable "image_tag" {
  type        = string
  description = "The latest image for the application"
}

variable "ts_auth_tg" {
    type        = string
}
variable "ts_platform_tg" {
    type        = string
}
variable "ts_integration_tg" {
    type        = string
}
variable "ts_report_tg" {
    type        = string
}
