# aws_profile     = "default"
aws_region        = "us-east-1"
# instance_type   = "t3.micro"
# ssh_username    = "ubuntu"
vpc_id            = "vpc-01234567890123456"
subnet_id         = "subnet-01234567890123456"
security_group_id = "sg-01234567890123456"

ubuntu_version = {
  "22.04" = "22.04"
  "24.04" = "24.04"
}

ubuntu_codename = {
  "22.04" = "Jammy Jellyfish"
  "24.04" = "Noble Numbat"
}
