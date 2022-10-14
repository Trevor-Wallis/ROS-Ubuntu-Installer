#!/bin/bash
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

# Source ROS as it will only be sourced on future terminal launches
source /opt/ros/noetic/setup.bash

rosdep update

# Setup catkin workspace
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws

echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc