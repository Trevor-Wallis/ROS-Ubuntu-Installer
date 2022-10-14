# ROS Ubuntu Installer
Bash scripts for installing and settting up ROS noetic and a catkin workspace on Ubuntu 20.04. These scripts handle adding sourcing of the ROS and Catkin setup.bash files to your .bashrc file to make future ROS work easier.

These scripts were created specifically to satisfy the ROS installation requirements of the Fall 2022 semester of ME439 at UW-Madison. Editors/IDEs are not installed by this script and can be added based on the user's preference.

## Downloading the scripts
To use these scripts, they need to be downloaded to your Linux machine. This can be done using wget.

```
wget https://github.com/Trevor-Wallis/ROS-Ubuntu-Installer/blob/main/ros_install.sh
wget https://github.com/Trevor-Wallis/ROS-Ubuntu-Installer/blob/main/ros_setup.sh
```

## Installing
ros_install.sh takes care of installing the needed packages for ROS and needs to be run as root
ros_setup.sh should be run by the account ROS development is being done with as it makes ROS and the Catkin workspace it creates be sourced on bash shell startup.

```
chmod +x ros_install.sh ros_setup.sh
sudo ./ros_install.sh
./ros_setup.sh
```

## Post Install
After installing, the catkin workspace needs to be initialized using the following commands.

```
cd ~/catkin_ws
catkin_make
```