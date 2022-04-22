#!/bin/sh

UBUNTU_VERSION=$1

if [ ! -f "vars/vars-${UBUNTU_VERSION}.json" ]; then
  echo "abort, target variable file not exit."
  exit 1
fi

packer build -var-file vars/vars-${UBUNTU_VERSION}.json templates/ubuntu.json
