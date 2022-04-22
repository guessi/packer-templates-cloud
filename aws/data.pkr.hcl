data "amazon-ami" "xenial" {
  profile     = var.aws_profile
  region      = var.aws_region
  owners      = ["099720109477"]
  most_recent = true

  filters = {
    name                = "ubuntu/images/*ubuntu-xenial-16.04-amd64-server-*"
    root-device-type    = "ebs"
    virtualization-type = "hvm"
  }
}

data "amazon-ami" "bionic" {
  profile     = var.aws_profile
  region      = var.aws_region
  owners      = ["099720109477"]
  most_recent = true

  filters = {
    name                = "ubuntu/images/*ubuntu-bionic-18.04-amd64-server-*"
    root-device-type    = "ebs"
    virtualization-type = "hvm"
  }
}

data "amazon-ami" "focal" {
  profile     = var.aws_profile
  region      = var.aws_region
  owners      = ["099720109477"]
  most_recent = true

  filters = {
    name                = "ubuntu/images/*ubuntu-focal-20.04-amd64-server-*"
    root-device-type    = "ebs"
    virtualization-type = "hvm"
  }
}

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
