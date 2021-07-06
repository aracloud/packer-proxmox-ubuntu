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

cat <<EOF > ~/hostset.sh
#!/bin/bash

cd /home/ubuntu

# set hostname to what dhcp has configured for that MAC/IP
# and hostset.done file does not exist (one time execution)
if [ ! -f hostset.done ]
then
    myip=\$(ifconfig ens18 |grep netmask |cut -d " " -f 10)
    myhostname=\$(nslookup \$myip |grep "name ="|sed 's/^.*name = //' |cut -d "." -f 1)
    echo \$myhostname > hostname
    sudo mv hostname /etc/hostname
    sudo sed -i s/ubuntu-20-04/\$myhostname/g /etc/hosts
    touch hostset.done
    sudo reboot
fi
EOF

echo \@reboot root /usr/bin/sh /home/ubuntu/hostset.sh > hostset.cron
sudo mv hostset.cron /etc/cron.d/
sudo chown root.root /etc/cron.d/hostset.cron

