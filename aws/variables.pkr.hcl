variable "aws_profile" {
  type    = string
  default = env("AWS_PROFILE")

  validation {
    condition     = length(var.aws_profile) > 0
    error_message = "The aws_profile var is not set."
  }
}

variable "aws_region" {
  type    = string
  default = env("AWS_REGION")

  validation {
    condition     = length(var.aws_region) >= 9 # min_length xx-xxxx-x
    error_message = "Invalid aws_region."
  }
}

variable "instance_type" {
  type    = string
  default = "t3.micro"

  validation {
    condition     = length(var.instance_type) >= 7 # min_length "t3.nano"
    error_message = "Invalid instance_type."
  }
}

variable "ssh_username" {
  type    = string
  default = "ubuntu"

  validation {
    condition     = length(var.ssh_username) > 0
    error_message = "Invalid ssh_username."
  }
}

variable "vpc_id" {
  type    = string
  default = null

  validation {
    condition     = length(var.vpc_id) >= 10 # min_length vpc-xxxxxx
    error_message = "Invalid vpc_id."
  }
}

variable "subnet_id" {
  type    = string
  default = null

  validation {
    condition     = length(var.subnet_id) >= 13 # min_length subnet-xxxxxx
    error_message = "Invalid subnet_id."
  }
}

variable "security_group_id" {
  type    = string
  default = null

  validation {
    condition     = length(var.security_group_id) >= 9 # min_length sg-xxxxxx
    error_message = "Invalid security_group_id."
  }
}

variable "ubuntu_version" {
  type = map(string)
  default = {
    "22.04" = "22.04"
  }
  # validation => how to validate map(string) ...?
}

variable "ubuntu_codename" {
  type = map(string)
  default = {
    "22.04" = "Jammy Jellyfish"
  }
  # validation => how to validate map(string) ...?
}
