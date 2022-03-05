build {
  sources = [
    "source.amazon-ebs.xenial",
    "source.amazon-ebs.bionic",
    "source.amazon-ebs.focal",
  ]

  provisioner "shell" {
    script = "./scripts/bootstrap.sh"
  }

  provisioner "shell" {
    script = "./scripts/setup-cloudwatch-agent.sh"
  }
}
