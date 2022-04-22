source "amazon-ebs" "xenial" {
  ami_description         = local.ami_description_xenial
  ami_name                = local.ami_name_xenial
  ami_virtualization_type = local.ami_virtualization_type
  ssh_interface           = local.ssh_interface
  instance_type           = var.instance_type
  profile                 = var.aws_profile
  region                  = var.aws_region
  security_group_id       = var.security_group_id
  source_ami              = data.amazon-ami.xenial.id
  ssh_username            = var.ssh_username
  subnet_id               = var.subnet_id
  vpc_id                  = var.vpc_id
  tags                    = local.tags_xenial
  temporary_key_pair_type = "ed25519"
}

source "amazon-ebs" "bionic" {
  ami_description         = local.ami_description_bionic
  ami_name                = local.ami_name_bionic
  ami_virtualization_type = local.ami_virtualization_type
  ssh_interface           = local.ssh_interface
  instance_type           = var.instance_type
  profile                 = var.aws_profile
  region                  = var.aws_region
  security_group_id       = var.security_group_id
  source_ami              = data.amazon-ami.bionic.id
  ssh_username            = var.ssh_username
  subnet_id               = var.subnet_id
  vpc_id                  = var.vpc_id
  tags                    = local.tags_bionic
  temporary_key_pair_type = "ed25519"
}

source "amazon-ebs" "focal" {
  ami_description         = local.ami_description_focal
  ami_name                = local.ami_name_focal
  ami_virtualization_type = local.ami_virtualization_type
  ssh_interface           = local.ssh_interface
  instance_type           = var.instance_type
  profile                 = var.aws_profile
  region                  = var.aws_region
  security_group_id       = var.security_group_id
  source_ami              = data.amazon-ami.focal.id
  ssh_username            = var.ssh_username
  subnet_id               = var.subnet_id
  vpc_id                  = var.vpc_id
  tags                    = local.tags_focal
  temporary_key_pair_type = "ed25519"
}

source "amazon-ebs" "jammy" {
  ami_description         = local.ami_description_jammy
  ami_name                = local.ami_name_jammy
  ami_virtualization_type = local.ami_virtualization_type
  ssh_interface           = local.ssh_interface
  instance_type           = var.instance_type
  profile                 = var.aws_profile
  region                  = var.aws_region
  security_group_id       = var.security_group_id
  source_ami              = data.amazon-ami.jammy.id
  ssh_username            = var.ssh_username
  subnet_id               = var.subnet_id
  vpc_id                  = var.vpc_id
  tags                    = local.tags_jammy
  temporary_key_pair_type = "ed25519"
}
