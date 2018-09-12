# Getting started with ROS & Turtlebot 3

## Setup

### Pre-requisites

An installation of [Ubuntu 16.04 64-bit](https://www.ubuntu.com/download/alternative-downloads) or equivalent is needed. Do not install in a virtual machine.

### ROS Kinetic

Open up a terminal prompt (Ctrl+Alt+T) and perform the following commands, one at a time (insert your password when needed):

```bash
sudo apt update
sudo apt upgrade
sudo apt install terminator
wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic.sh && chmod 755 ./install_ros_kinetic.sh && bash ./install_ros_kinetic.sh
```

You now have ROS installed and can start learning it with the [Tutorials](http://wiki.ros.org/ROS/Tutorials). However, let's complete this guide first.

### Turtlebot 3

Install the following packages using a terminal prompt:

```bash
sudo apt install ros-kinetic-joy ros-kinetic-teleop-twist-joy ros-kinetic-teleop-twist-keyboard ros-kinetic-laser-proc ros-kinetic-rgbd-launch ros-kinetic-depthimage-to-laserscan ros-kinetic-rosserial-arduino ros-kinetic-rosserial-python ros-kinetic-rosserial-server ros-kinetic-rosserial-client ros-kinetic-rosserial-msgs ros-kinetic-amcl ros-kinetic-map-server ros-kinetic-move-base ros-kinetic-urdf ros-kinetic-xacro ros-kinetic-compressed-image-transport ros-kinetic-rqt-image-view ros-kinetic-gmapping ros-kinetic-navigation ros-kinetic-interactive-markers
```

Now download and compile some other packages with:

```bash
cd ~/catkin_ws/src/
git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
git clone https://github.com/ROBOTIS-GIT/turtlebot3.git
cd ~/catkin_ws && catkin_make
```
