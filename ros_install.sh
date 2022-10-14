#!/bin/bash
sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
apt-get install curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -
apt-get update

apt-get --assume-yes install ros-noetic-desktop-full
apt-get --assume-yes install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
rosdep init
apt-get --assume-yes install python3-scipy
apt-get --assume-yes install net-tools

## Add ROS packages we want
# ROS package "imu_tools"
apt-get --assume-yes install ros-noetic-imu-tools

# ROS package "sick_scan"
apt-get --assume-yes install ros-noetic-sick-scan

# ROS package "teleop_tools"
apt-get --assume-yes install ros-noetic-teleop-tools

# ROS package "gmapping"
apt-get --assume-yes install ros-noetic-gmapping
apt-get --assume-yes install ros-noetic-slam-gmapping

# ROS package "teleop_twist_keyboard"
apt-get --assume-yes install ros-noetic-teleop-twist-keyboard