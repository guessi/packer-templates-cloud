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

source "amazon-ebs" "noble" {
  ami_description         = local.ami_description_noble
  ami_name                = local.ami_name_noble
  ami_virtualization_type = local.ami_virtualization_type
  ssh_interface           = local.ssh_interface
  instance_type           = var.instance_type
  profile                 = var.aws_profile
  region                  = var.aws_region
  security_group_id       = var.security_group_id
  source_ami              = data.amazon-ami.noble.id
  ssh_username            = var.ssh_username
  subnet_id               = var.subnet_id
  vpc_id                  = var.vpc_id
  tags                    = local.tags_noble
  temporary_key_pair_type = "ed25519"
}