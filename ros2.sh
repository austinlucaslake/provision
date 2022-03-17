#!/bin/bash

# update repositories
sudo apt update && sudo apt upgrade

# ROS2 Foxy
sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
sudo apt install curl gnupg2 lsb-release
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  >
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros->
sudo apt update && sudo apt install ros-foxy-desktop
echo "source /opt/ros/foxy/setup.bash" >> ~/.bashrc
echo "export ROS_DOMAIN_ID=4" >> ~/.bashrc
sudo apt install python3-colcon-common-extensions
sudo apt install ros-foxy-navigation2 ros-foxy-nav2-bringup '~ros-foxy-turtlebo>
sudo apt install ros-foxy-camera-calibration-parsers
sudo apt install ros-foxy-camera-info-manager
sudo apt install ros-foxy-launch-testing-ament-cmake
