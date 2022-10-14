#!/bin/bash

fullROSInstall=0
installSpyder3=0

# Promt user if they want a full install of ROS desktop or just a base install
echo "Which version of ROS Noetic do you want to install?"
echo "Full(f) (Recommended, includes simulators)"
echo "Base(b) (Smaller install size)"
while true: do
	read -p "" yn
    	case $yn in
        	[F|f]* ) fullROSInstall=1;;
        	[N|n]* ) fullROSInstall=0;;
        	* ) read -p "Please enter full(f) or base(b)" yn;;
	esac
done

# Promt user if they want to install Spyder3
echo "Do you want to install Spyder3 (A Python IDE)?"
read -p "yes(y) or no(n) " yn
while true: do
	case $yn in
		[Y|y]* ) installSpyder3=1; break;;
		[Nn]* ) installSpyder3=0; break;;
		* ) read -p "Please enter yes(y) or no(n) " yn;;
	esac
done


sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
apt-get install curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -
apt-get update

if fullROSInstall
then
	apt-get --assume-yes install ros-noetic-desktop-full
else
	apt-get --assume-yes install ros-noetic-desktop
fi
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

# Install Spyder3 if desired
if installSpyder3
then
	apt-get --assume-yes install spyder3
fi