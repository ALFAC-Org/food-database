variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "VPC ID - VPC Created in the infrastructure repo" 
  type        = string
}

variable "subnet_database_1_cidr_block" {
  description = "CIDR block for the database subnet"
  type        = string
}

variable "subnet_database_2_cidr_block" {
  description = "CIDR block for the database subnet"
  type        = string
}

variable "subnet_availability_zone_az_1" {
  description = "Availability zone for the subnets"
  type        = string
}

variable "subnet_availability_zone_az_2" {
  description = "Availability zone 2 for the subnets"
  type        = string
}

variable "db_username" {
  description = "The username for the RDS instance"
  type        = string
}

variable "db_password" {
  description = "The password for the RDS instance"
  type        = string
  sensitive   = true
}

variable "arn_aws_lab_role" {
  description = "ARN for the IAM role"
  type        = string
}