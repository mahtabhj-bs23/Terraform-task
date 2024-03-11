output "bucket_name" {
  value = module.task-station-portal-bucket.s3_bucket_bucket_domain_name
}

output "s3_bucket_bucket_regional_domain_name" {
  value=module.task-station-portal-bucket.s3_bucket_bucket_regional_domain_name
}
