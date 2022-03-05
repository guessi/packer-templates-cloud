#!/bin/sh

packer build -var-file vars/ubuntu.pkvars.hcl .
