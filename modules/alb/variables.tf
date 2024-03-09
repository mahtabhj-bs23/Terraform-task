variable "tag" {
  type = string
}
variable "vpc_id" {
  type = string
}
variable "public_subnets" {
  type = list(string)
}
variable "ecs_cluster_name" {
  type = string
}
variable "alb_acm_certificate_arn" {
  type = string
}
variable "alb_domain_name" {
  type = string
}