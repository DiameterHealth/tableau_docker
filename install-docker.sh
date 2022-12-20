#!/bin/bash

# Update package index
sudo yum update

# Install required packages
sudo yum install -y yum-utils device-mapper-persistent-data lvm2

# Add Docker's official GPG key
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

# Install Docker CE
sudo yum install docker-ce

# Start Docker
sudo systemctl start docker

sleep 5

#run docker without sudo
sudo chown $USER /var/run/docker.sock
