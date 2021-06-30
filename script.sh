#!/bin/bash -eux

date > provision.txt
# Install  tools needed
sudo apt -y update
sudo apt -y upgrade
sudo apt -y install \
software-properties-common \
net-tools \
cloud-initramfs-growroot
