#!/bin/bash

# Update package index
yum update

# Install required packages
yum install -y yum-utils device-mapper-persistent-data lvm2

# Add Docker's official GPG key
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

# Install Docker CE
yum install docker-ce

# Start Docker
systemctl start docker

sleep 5

#run docker without sudo
sudo chown $USER /var/run/docker.sock
