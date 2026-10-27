variable "aws_region" {
  description = "AWS region for the state bucket and lock table"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project name used in tags"
  type        = string
  default     = "terraform-ec2-remote-state"
}

# Adding the bucket name and lock table name as variables to make it easier to change them in one place if needed.

variable "state_bucket_name" {
  description = "Globally unique S3 bucket name (set by TF_VAR_state_bucket_name)"
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9.-]{1,61}[a-z0-9]$", var.state_bucket_name))
    error_message = "Bucket name must be 3-63 chars: lowercase letters, numbers, dots, hyphens."
  }
}

variable "lock_table_name" {
  description = "DynamoDB table name for state locking (set by TF_VAR_lock_table_name)"
  type        = string
  default     = "terraform-state-lock"
}

