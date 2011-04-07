#!/bin/sh

# Setup
apt-get update
apt-get -y upgrade

# Vagrant: ssh
mkdir /home/vagrant/.ssh
wget --no-check-certificate \
    'http://github.com/mitchellh/vagrant/raw/master/keys/vagrant.pub' \
    -O /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh
chmod -R go-rwsx /home/vagrant/.ssh
# Vagrant: sudo
sed -i -e 's/%admin ALL=(ALL) ALL/%admin ALL=NOPASSWD:ALL/g' /etc/sudoers

# VirtualBox
apt-get -y install build-essential linux-headers-$(uname -r)
VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
cd /tmp
wget http://download.virtualbox.org/virtualbox/$VBOX_VERSION/\
VBoxGuestAdditions_$VBOX_VERSION.iso
mount -o loop VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm VBoxGuestAdditions_$VBOX_VERSION.iso

# Chef
source /etc/lsb-release
echo "deb http://apt.opscode.com/ ${DISTRIB_CODENAME} main" \
    > /etc/apt/sources.list.d/opscode.list
wget -q -O- http://apt.opscode.com/packages@opscode.com.gpg.key \
    | apt-key add -
apt-get update
export DEBIAN_FRONTEND=noninteractive
apt-get -y install chef

# Clean
apt-get -y autoremove
apt-get -y clean
