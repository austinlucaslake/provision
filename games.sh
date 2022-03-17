#!/bin/bash

# move to Download folder
cd ~/Downloads

# update repositories
sudo apt update -y

# Minecraft
wget https://launcher.mojang.com/download/Minecraft.deb
sudo apt install Minecraft.deb -y

# Steam
sudo apt install steam -y

# return to provision folder
cd ~/code/provision
