#!/bin/bash

if [[ -z $1 || ($1 != "ARM64" && $1 != "AMD64") ]]
then
    echo "Use AMD64 or ARM64 as parameter"
    exit
fi

sudo apt update

# VSCODE
echo "=============================="
echo "Installing VSCODE"
echo "=============================="
sudo apt install software-properties-common apt-transport-https wget -y
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=${1,,}] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code -y

# code --install-extension donjayamanne.python-extension-pack --force
# code --install-extension donjayamanne.git-extension-pack --force
# code --install-extension ms-vscode.sublime-keybindings --force

# TERMINATOR
echo "=============================="
echo "Installing TERMINATOR"
echo "=============================="
sudo apt install terminator -y
wget https://raw.githubusercontent.com/OlivierProTips/HackNotes/main/Terminator/config
mkdir -p ~/.config/terminator
mv config ~/.config/terminator/config

# VIM
echo "=============================="
echo "Setting VIM"
echo "=============================="
mv .vimrc ~

# ZSH
echo "=============================="
echo "Setting ZSH"
echo "=============================="
mv .zshrc ~

# UPLOAD
echo "=============================="
echo "Installing UPLOAD"
echo "=============================="
wget https://raw.githubusercontent.com/OlivierProTips/HackNotes/main/scripts/upload_file_wget.sh
sudo mv upload_file_wget.sh /usr/local/bin
sudo chmod +x /usr/local/bin/upload_file_wget.sh

# MONIP
echo "=============================="
echo "Installing MONIP"
echo "=============================="
wget https://raw.githubusercontent.com/OlivierProTips/HackNotes/main/scripts/monip.sh
sudo mv monip.sh /usr/local/bin
sudo chmod +x /usr/local/bin/monip.sh
sudo ln -s /usr/local/bin/monip.sh /usr/local/bin/monip

# NMAPER
echo "=============================="
echo "Installing NMAPER"
echo "=============================="
wget https://raw.githubusercontent.com/OlivierProTips/nmaper/master/nmaper.py
sudo mv nmaper.py /usr/local/bin
sudo chmod +x /usr/local/bin/nmaper.py
sudo ln -s /usr/local/bin/nmaper.py /usr/local/bin/nmaper

# LESS
echo "=============================="
echo "Installing LESS"
echo "=============================="
if [[ -d ~/Desktop ]]
then
    mv less.sh ~/Desktop
elif [[ -d ~/Bureau ]]
then
    mv less.sh ~/Bureau
else
    echo "less.sh has not been moved"
fi