variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project name used in tags"
  type        = string
  default     = "terraform-ec2-remote-state"
}

variable "environment" {
  description = "Environment Name: dev, staging or prod"
  type        = string
  default     = "dev"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Name of an existing EC2 key pair (TF_VAR_key_name)"
  type        = string
}

variable "ssh_allowed_cidr" {
  description = "CIDR allowed to SSH, e.g. your home IP address (TF_VAR_ssh_allowed_cidr)"
  type        = string

  validation {
    condition     = can(cidrhost(var.ssh_allowed_cidr, 0))
    error_message = "ssh_allowed_cidr must be a valid CIDR block, e.g. 192.168.1.0/32."
  }
}