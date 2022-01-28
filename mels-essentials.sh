#!/bin/bash
#-*-ENCODING:UTF-8-*-

su && apt update && apt upgrade

#sudoapt
sudo apt install snap docker.io git gh neofetch links2 libreoffice virtualbox -y

#nodejs
curl -fsSL https://deb.nodesource.com/setup_17.x | sudo -E bash -
sudo apt-get install -y nodejs


#sudosnap
sudo snap install microk8s --classic -y
sudo microk8s enable dns dashboard storage ingress
sudo snap install --classic code
sudo snap install slack --classic


#usermod
sudo usermod -aG docker $USER
sudo usermod -aG microk8s $USER

#npm_stuff
sudo npm install -g yarn
sudo npm install -g cypress

#install Go
sudo wget -c https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz -O - | sudo tar -xz -C /usr/local

#patch_$PATH
diff $HOME/.profile profile_new > profile_patch
patch $HOME/.profile -i profile_patch -o .profile
mv .profile $HOME/.profile
source ~/.profile
rm profile_patch
 
#boltbrowser
cd $HOME
go install github.com/br0xen/boltbrowser@2.1
mv go/bin/boltbrowser /usr/local/go/bin
cd /melsessential


#Brave Browser
sudo apt install apt-transport-https curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser
