#!/bin/bash
#Update the apt package index and install 
#packages to allow apt to use a repository over HTTPS
id
sudo apt-get update
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
#Add Docker’s official GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
#Set up the repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
#Update the apt package index:
sudo apt-get update
#Install Docker Engine, containerd, and Docker Compose
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose
sudo usermod -a -G docker ubuntu
#Verify that the Docker Engine installation is successful by running the hello-world image
#Remove "successful-installing-checking-container" if docker works properly 
#sudo docker run --name hello-world-container hello-world && sudo docker rm hello-world-container
