#!/bin/bash

user=$(id -un)

mkdir -p /home/$user/build

sudo apt-get install xinit  -y    
sudo apt install libx11-dev -y
sudo apt install libxft-dev -y
sudo apt install gcc        -y
sudo apt-get update         -y
sudo apt-get install        -y      libxinerama-dev

cd /home/$user/build
git clone https://git.suckless.org/dwm
git clone https://git.suckless.org/dmenu
git clone https://git.suckless.org/st

cd dwm
sudo make clean install
cd ..
cd dmenu
sudo make clean install
cd ..
cd st
sudo make clean install

echo 'exec edwm' >> /home/$user/.xsessionrc
echo 'if [ -z "$DISPLAY" ] && [ $(tty) == /dev/tty1 ]; then\n
startx\n
fi' >> /home/$user/.profile

