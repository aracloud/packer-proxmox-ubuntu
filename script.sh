#!/bin/bash -eux

date > provision.txt
#sudo apt install cloud-initramfs-growroot Install  tools needed
sudo apt -y update
sudo apt -y upgrade
sudo apt -y install \
software-properties-common \
net-tools \
cloud-initramfs-growroot \
docker \
docker-compose \
ntpdate
