# CustomDebian
script to build your custom live Debian


Setup
=====
```  
git clone https://github.com/Oros42/CustomDebian.git  
cd CustomDebian  
./build_custom_debian.sh  
```

Build your custom Debian
========================
```
CustomDebian
.
├── build_custom_debian.sh
├── config  <-- edit this file
├── custom_conf
│   └── etc <-- put here your customs conf who are copy in /etc/ of your live
├── default
│   ├── config
│   ├── custom_conf
│   │   └── etc
│   └── other_files
│       ├── setup_in_chroot.sh
│       └── splash.png
├── livework <-- it's where ISO is build
└── other_files
    ├── setup_in_chroot.sh <-- edit this file and add what you want to setup in your live
    └── splash.png <-- change this picture if you want
```

Let's go to build !  
```
sudo ./build_custom_debian.sh new
```
And get your ISO in CustomDebian/livework/?.iso  
  
You want to add something in your live ?  
========================================
```
cd CustomDebian/livework/
chroot chroot
# Here, your are in the chroot of your live Debian
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
And get your new ISO in CustomDebian/livework/?.iso  
