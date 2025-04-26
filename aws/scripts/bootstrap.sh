#!/usr/bin/env bash

# exit if any failure occurred
set -o errexit
set -o nounset
set -o pipefail

UBUNTU_CODE_NAME="$(awk -F'=' '/UBUNTU_CODENAME/{print$2}' /etc/os-release)"

# basic requirements
sudo apt update
sudo DEBIAN_FRONTEND=noninteractive apt install -y \
    apt-transport-https ca-certificates curl gnupg

# docker's official GPG key
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# setup docker repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu ${UBUNTU_CODE_NAME} stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# setup docker and pin version
sudo apt update
sudo DEBIAN_FRONTEND=noninteractive apt install -y -qq --no-install-recommends \
    docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo apt-mark hold docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# allow user "ubuntu" to execute "docker" without "sudo"
sudo usermod -aG docker ubuntu

# ensure docker will start on boot
sudo systemctl enable docker.service
sudo systemctl start docker.service

# ensure system packages are up to date
sudo DEBIAN_FRONTEND=noninteractive apt dist-upgrade -y

# common packages
sudo DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
    fail2ban \
    git \
    iftop \
    jq \
    openssh-client \
    openssh-server \
    tcpdump \
    tree \
    vim \
    wget

# setup awscli via snap
sudo snap install aws-cli --classic --stable # HINT: to prevent too many dependencies being installed
