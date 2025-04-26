locals {
  timestamp               = regex_replace(timestamp(), "[- TZ:]", "")
  ami_virtualization_type = "hvm"
  ssh_interface           = "public_ip"

  ami_description_jammy  = format("ubuntu-server-%s", split(" ", lower(lookup(var.ubuntu_codename, "22.04", "")))[0])

  ami_name_jammy  = format("%s-%s", local.ami_description_jammy, local.timestamp)

  ami_os_info_jammy  = format("Ubuntu Server %s LTS (%s)", lookup(var.ubuntu_version, "22.04", ""), lookup(var.ubuntu_codename, "22.04", ""))

  tags_jammy = {
    Created = local.timestamp
    Name    = local.ami_name_jammy
    OS      = local.ami_os_info_jammy
    Packer  = "true"
  }
}
