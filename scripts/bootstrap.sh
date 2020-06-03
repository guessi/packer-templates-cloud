#!/usr/bin/env bash

# exit if any failure occurred
set -o errexit
set -o nounset
set -o pipefail

# basic requirements
sudo apt-get update -qq
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
    apt-transport-https ca-certificates curl

# setup docker repository
curl -fsSL "https://download.docker.com/linux/ubuntu/gpg" | sudo apt-key add -qq -
echo "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/ubuntu $(lsb_release --codename | cut -f2) stable" | sudo tee /etc/apt/sources.list.d/docker.list

# setup docker daemon
sudo apt-get update -qq >/dev/null
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y -qq --no-install-recommends docker-ce

# allow user "ubuntu" to execute "docker" without "sudo"
sudo usermod -aG docker ubuntu

# ensure docker will start on boot
sudo systemctl enable docker.service

# set docker bridge ip and restart service
echo '{"bip": "172.29.0.1/16"}' | sudo tee /etc/docker/daemon.json
sudo systemctl restart docker.service

# setup docker-compose
DOCKER_COMPOSE_VERSION="$(curl -sLI https://github.com/docker/compose/releases/latest -o /dev/null -w '%{url_effective}' | cut -d '/' -f 8)"
sudo curl -o /usr/local/bin/docker-compose \
          -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)"
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# ensure system packages are up to date
sudo DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y

# common packages
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    fail2ban \
    git \
    gnupg \
    iftop \
    jq \
    openssh-client \
    openssh-server \
    tcpdump \
    vim \
    wget

# setup awscli via snap
sudo snap install aws-cli --classic --stable # HINT: to prevent too many dependencies being installed
