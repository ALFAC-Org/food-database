# AWS provider configuration
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "arn_aws_lab_role" {
  description = "ARN for the IAM role"
  type        = string
}