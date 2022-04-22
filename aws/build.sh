#!/bin/sh

packer init -upgrade .
packer build -var-file vars/ubuntu.pkvars.hcl .
