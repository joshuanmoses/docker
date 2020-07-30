#!/bin/bash
#Get Docker Engine - Community for CentOS + docker compose
set -e
#Uninstall old versions
sudo yum remove docker docker-common docker-selinux docker-engine-selinux docker-engine docker-ce
#Update the packages:
sudo yum update -y
#Install needed packages
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
# Configure the docker-ce repo:
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
# Install the latest docker-ce
sudo yum install docker-ce
# Enable & start docker
sudo systemctl enable docker.service
sudo systemctl start docker.service
# add current user to the docker group to avoid using sudo when running docker
sudo usermod -a -G docker $(whoami)
# Output current version
docker -v
