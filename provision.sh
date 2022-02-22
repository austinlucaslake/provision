#!/bin/bash

# move to Downloads folder
cd ~/Downloads

# Google Chrome
sudo apt update
wget -O chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./chrome.deb

# Discord
sudo apt update
wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo apt install ./discord.deb

# Slack
sudo apt update
wget -O slack.deb https://downloads.slack-edge.com/linux_releases/slack-desktop-4.3.2-amd64.deb
sudo apt install ./slack.deb

# Spotify
sudo apt update
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client

# VirtualBox
sudo apt update
wget -o virtualbox.deb https://download.virtualbox.org/virtualbox/6.1.32/virtualbox-6.1_6.1.32-149290~Ubuntu~eoan_amd64.deb
sudo apt install ./virtualbox.deb

# Sticky Notes
sudo apt update
sudo apt-get install xpad

# gcc, g++, make
sudo apt update
sudo apt install build-essential
sudo apt-get install manpages-dev

# Anaconda
sudo apt update
wget -O anaconda.sh https://repo.anaconda.com/archive/Anaconda3-2021.11-Linux-x86_64.sh
bash ~/Downloads/anaconda.sh

# Visual Studio Code
sudo apt update
wget -O vscode.deb "https://go.microsoft.com/fwlink/?LinkID=760868"
sudo apt install ./vscode.deb

# gtkterm
sudo apt update
sudo apt install gtkterm

# ROS2 Foxy
sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
sudo apt update && sudo apt install curl gnupg2 lsb-release
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update
sudo apt install ros-foxy-desktop
echo "source /opt/ros/foxy/setup.bash" >> ~/.bashrc
echo "export ROS_DOMAIN_ID=4" >> ~/.bashrc
sudo apt update
sudo apt install python3-colcon-common-extensions
sudo apt install ros-foxy-navigation2 ros-foxy-nav2-bringup '~ros-foxy-turtlebot3-.*'

# Remove unwanted packages
sudo apt update
sudo apt purge firefox
sudo apt purge thunderbird*
rm -rf ~/.mozilla
sudo apt purge libreoffice-common
sudo apt autoremove

# Update/upgrade packages, and reboot
sudo apt upgrade && sudo apt upgrade && sudo apt reboot
