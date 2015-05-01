# CustomDebian
Script to build your custom liveCD Debian.

Lazy mode / TL;DR
=================

```  
git clone https://github.com/Oros42/CustomDebian.git
cd CustomDebian
sudo ./build_custom_debian.sh new
```
And get your ISO in ./livework/Amnesia-Debian-amd64.iso
Estimated time : 20 minutes with a 400 kB/s Internet connection.  
Size of ISO : 189 Mo  
By default, on boot, the whole system is load in RAM. So you need at least 200Mo of RAM. And you can remove the USB key or liveCD after booting.  
  
  
Build your custom Debian
========================


Setup
-----
```  
git clone https://github.com/Oros42/CustomDebian.git
cd CustomDebian
./build_custom_debian.sh
```
  
  
Customize your Debian
------------------
```
CustomDebian
.
├── build_custom_debian.sh <-- the only file you should run
├── config  <-- edit this file
├── custom_conf
│   └── etc <-- put here your customs conf who are copy in /etc/ of your live
├── custom_setup <-- put here your scripts which will be run in chroot.
│                    (Examples https://github.com/Oros42/CustomDebianSetup ) 
│   ├── default.sh
│   └── README.md
├── default <-- don't touch
├── livework <-- it's where ISO is build
└── other_files
    ├── setup_in_chroot_footer.sh
    ├── setup_in_chroot_head.sh
    └── splash.png <-- change this picture if you want
```

Let's go to build !
-------------------
```
sudo ./build_custom_debian.sh new
```
And get your ISO in ./livework/?.iso  
Estimated time : 20 minutes with a 400 kB/s Internet connection.  
Size of ISO : 189 Mo  
By default, on boot, the whole system is load in RAM. So you need at least 200Mo of RAM. And you can remove the USB key or liveCD after booting.  
  
  
You want to add something in your liveCD ?  
========================================
```
cd CustomDebian/livework/
chroot chroot
# Here, your are in the chroot of your liveCD Debian
mount none -t proc /proc
mount none -t sysfs /sys
mount none -t devpts /dev/pts
export HOME=/root
export LC_ALL=C
export PS1="\e[01;31m(live):\W \$ \e[00m"

# Do what you want :-)

umount /proc /sys /dev/pts
exit
# exit chroot
cd ..
```
And rebuild your live :  
```
sudo ./build_custom_debian.sh rebuild
```
And get your new ISO in ./livework/?.iso  
