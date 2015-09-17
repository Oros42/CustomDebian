apt-get clean
rm -rf /tmp/*
/etc/init.d/dbus stop
umount -f /proc /sys /dev/pts
exit
