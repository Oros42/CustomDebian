#!/bin/bash
mount none -t proc /proc
mount none -t sysfs /sys
mount none -t devpts /dev/pts
export HOME=/root
export LC_ALL=C
export PS1="\e[01;31m(live):\W \$ \e[00m"

apt-get update
apt-get upgrade -y
apt-get install -y dialog dbus
dbus-uuidgen > /var/lib/dbus/machine-id
apt-get install -y linux-image-$(uname -r) live-boot


#-------------------------------------------------------------------#
#                Put here your custom setup                         #
#-------------------------------------------------------------------#
apt-get install -y nano iftop htop openssh-client openssh-server less openssl ca-certificate
echo -e "\033[31mPassword for root\033[0m"
passwd root



#-------------------------------------------------------------------#

apt-get clean
rm /var/lib/dbus/machine-id
rm -rf /tmp/*
umount /proc /sys /dev/pts
exit
