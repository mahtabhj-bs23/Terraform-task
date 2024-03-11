module "task-station-portal-bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket                   = "task-station-${var.tag}-frontend-bucket"
  control_object_ownership = true
  block_public_acls        = true
  block_public_policy      = true
  ignore_public_acls       = true
  restrict_public_buckets  = true

  versioning   = {
    enabled = false
  }

   cors_rule = [
    {
      allowed_methods = ["PUT"]
      allowed_origins = ["*"]
      allowed_headers = ["*"]
      expose_headers  = []
      max_age_seconds = 3000
    }
  ]

}

data "aws_iam_policy_document" "s3_bucket_policy" {
  statement {
    actions   = ["s3:GetObject","s3:ListBucket"]
    resources = ["${module.task-station-portal-bucket.s3_bucket_arn}/*",
                  module.task-station-portal-bucket.s3_bucket_arn]

    principals {
      type        = "AWS"
      identifiers = var.cloudfront_origin_access_identity_iam_arns
    }
  }
}
# S3 bucket policy update for cloudfront
resource "aws_s3_bucket_policy" "task_station_s3_bucket_policy" {
  bucket = module.task-station-portal-bucket.s3_bucket_id
  policy = data.aws_iam_policy_document.s3_bucket_policy.json
}