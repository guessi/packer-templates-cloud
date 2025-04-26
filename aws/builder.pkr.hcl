build {
  sources = [
    "source.amazon-ebs.jammy", // 22.04
    "source.amazon-ebs.noble", // 24.04
  ]

  provisioner "shell" {
    script = "./scripts/bootstrap.sh"
  }

  provisioner "shell" {
    script = "./scripts/setup-cloudwatch-agent.sh"
  }
}
