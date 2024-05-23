#!/bin/bash

user=$(id -un)

mkdir -p /home/$user/Build
mkdir -p /home/$user/Pictures/wallpapers


# Uncoment the lines below if you want to install firefox
#wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
#echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null

# Uncoment below any adittional package you want to install

# cmd         | option    |  package         | install |
sudo apt-get	update				-y
#sudo apt-get	install       firefox           -y
#sudo apt-get	install       xinit             -y
#sudo apt	install       xrandr            -y
#sudo apt        install       xcompmgr          -y
sudo apt        install       build-essential   -y
sudo apt	install       libx11-dev        -y
sudo apt	install       libxft-dev        -y
sudo apt	install       gcc               -y
sudo apt-get	install       libxinerama-dev   -y
#sudo apt	install       pulseaudio        -y
#sudo apt	install       nitrogen          -y
#sudo apt       install       xdotool		-y

cd /home/$user/build
git clone https://github.com/mr-v1c/dwm.git
git clone https://github.com/mr-v1c/mr-dmenu.git
git clone https://github.com/mr-v1c/mr-st.git

cd dwm
sudo make clean install
cd ..
cd dmenu
sudo make clean install
cd ..
cd st
sudo make clean install

# Uncomment if you chose to install xinit
#echo $'if [ -z "$DISPLAY" ] && [ $(tty) == /dev/tty1 ]; then\n startx\nfi' >> /home/$user/.profile

# Uncomment if you chose to install xrandr
#echo 'xranrd --output VGA-1 --mode 1920x1080 --rate 60 &' >> /home/$user/.xsessionrc

# Uncomment if you chose to xcompmgr
#echo 'xcompmgr &' >> /home/$user/.xsessionrc

# Uncomment if you chose to install pulseaudio
#echo'/usr/bin/pulseaudio &' >> /home/$user/.xsessionrc

# Uncomment if you chose to install nitrogen
#echo "nitrogen --set-auto --random /home/$user/Pictures/wallpapers/ &" >> /home/$user/.xsessionrc

echo $'while true;do\nxsetroot -name "$(/bin/date +"| %l:%M %p || %A %b %d || %Y |")"\nsleep 1m\ndone &' >> /home/$user/.xsessionrc

echo 'exec dwm' >> /home/$user/.xsessionrc

#uncomment if you installed xdotool
#echo 'xdotool key super+F5' >>/home/$user/.xsesionrc


