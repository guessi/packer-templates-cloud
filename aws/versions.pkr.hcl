packer {
  required_plugins {
    # https://github.com/hashicorp/packer-plugin-amazon
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = ">= 1.3.6"
    }
  }
}
