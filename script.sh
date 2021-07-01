#!/bin/bash -eux

date > provision.txt

# defined my software stack needed
sudo apt -y update
sudo apt -y upgrade
sudo apt -y install \
software-properties-common \
net-tools \
cloud-initramfs-growroot \
docker \
docker-compose \
ntpdate \
mlocate

# set hostname to what dhcp has configured for that MAC/IP
myip=(ifconfig ens18 |grep netmask |cut -d " " -f 10)
myhostname=(nslookup $myip |grep "name ="|sed 's/^.*name = //' |cut -d "." -f 1)
echo $myhostname > ~/hostname.txt

