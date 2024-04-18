module "sqs" {
  source  = "terraform-aws-modules/sqs/aws"
  name                      = "task-station-${var.tag}-sqs"
  fifo_queue = false
  max_message_size = 262144
  message_retention_seconds = 345600
  receive_wait_time_seconds = 10
  delay_seconds = 10

  tags = {
    Terraform   = "true"
    Environment = var.tag
  }
}