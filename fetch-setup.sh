#/bin/bash

# Download ubuntu
# https://docs.cloud-init.io/en/latest/tutorial/qemu.html
echo "Downloading Ubuntu 24.04 LTS"
mkdir -p img
if [ ! -f "img/ubuntu-noble.img" ]; then
    wget https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img -O img/ubuntu-noble.img
else 
    echo "Skipping download, img already exists"
fi

