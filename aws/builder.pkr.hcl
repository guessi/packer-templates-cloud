build {
  sources = [
    "source.amazon-ebs.jammy",
  ]

  provisioner "shell" {
    script = "./scripts/bootstrap.sh"
  }

  provisioner "shell" {
    script = "./scripts/setup-cloudwatch-agent.sh"
  }
}
