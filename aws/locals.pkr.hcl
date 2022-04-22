locals {
  timestamp               = regex_replace(timestamp(), "[- TZ:]", "")
  ami_virtualization_type = "hvm"
  ssh_interface           = "public_ip"

  ami_description_xenial = format("ubuntu-server-%s", split(" ", lower(lookup(var.ubuntu_codename, "16.04", "")))[0])
  ami_description_bionic = format("ubuntu-server-%s", split(" ", lower(lookup(var.ubuntu_codename, "18.04", "")))[0])
  ami_description_focal  = format("ubuntu-server-%s", split(" ", lower(lookup(var.ubuntu_codename, "20.04", "")))[0])
  ami_description_jammy  = format("ubuntu-server-%s", split(" ", lower(lookup(var.ubuntu_codename, "22.04", "")))[0])

  ami_name_xenial = format("%s-%s", local.ami_description_xenial, local.timestamp)
  ami_name_bionic = format("%s-%s", local.ami_description_bionic, local.timestamp)
  ami_name_focal  = format("%s-%s", local.ami_description_focal, local.timestamp)
  ami_name_jammy  = format("%s-%s", local.ami_description_jammy, local.timestamp)

  ami_os_info_xenial = format("Ubuntu Server %s LTS (%s)", lookup(var.ubuntu_version, "16.04", ""), lookup(var.ubuntu_codename, "16.04", ""))
  ami_os_info_bionic = format("Ubuntu Server %s LTS (%s)", lookup(var.ubuntu_version, "18.04", ""), lookup(var.ubuntu_codename, "18.04", ""))
  ami_os_info_focal  = format("Ubuntu Server %s LTS (%s)", lookup(var.ubuntu_version, "20.04", ""), lookup(var.ubuntu_codename, "20.04", ""))
  ami_os_info_jammy  = format("Ubuntu Server %s LTS (%s)", lookup(var.ubuntu_version, "22.04", ""), lookup(var.ubuntu_codename, "22.04", ""))

  tags_xenial = {
    Created = local.timestamp
    Name    = local.ami_name_xenial
    OS      = local.ami_os_info_xenial
    Packer  = "true"
  }

  tags_bionic = {
    Created = local.timestamp
    Name    = local.ami_name_bionic
    OS      = local.ami_os_info_bionic
    Packer  = "true"
  }

  tags_focal = {
    Created = local.timestamp
    Name    = local.ami_name_focal
    OS      = local.ami_os_info_focal
    Packer  = "true"
  }

  tags_jammy = {
    Created = local.timestamp
    Name    = local.ami_name_jammy
    OS      = local.ami_os_info_jammy
    Packer  = "true"
  }
}
