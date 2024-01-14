#!/bin/sh

# https://developer.hashicorp.com/packer/integrations/hashicorp/amazon
packer plugins install github.com/hashicorp/amazon

packer init -upgrade .
packer build -var-file vars/ubuntu.pkvars.hcl .
