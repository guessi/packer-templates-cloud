data "amazon-ami" "jammy" {
  profile     = var.aws_profile
  region      = var.aws_region
  owners      = ["099720109477"]
  most_recent = true

  filters = {
    name                = "ubuntu/images/*ubuntu-jammy-22.04-amd64-server-*"
    root-device-type    = "ebs"
    virtualization-type = "hvm"
  }
}

data "amazon-ami" "noble" {
  profile     = var.aws_profile
  region      = var.aws_region
  owners      = ["099720109477"]
  most_recent = true

  filters = {
    name                = "ubuntu/images/*ubuntu-noble-24.04-amd64-server-*"
    root-device-type    = "ebs"
    virtualization-type = "hvm"
  }
}
