Put here your scripts which will be run in chroot.  
Don't add  
```
#!/bin/bash
```
All scripts are concatenated in one.  

Example of script :  
apache.sh
```
apt-get install -y apache2 php5
echo "Hello world" > /var/www/index.html
```
