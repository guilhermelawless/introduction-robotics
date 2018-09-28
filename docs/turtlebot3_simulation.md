# Turtlebot 3 Simulation

This guide is based on the following tutorial for Turtlebot 3: http://emanual.robotis.com/docs/en/platform/turtlebot3/overview/ . If you want to explore more examples with this particular robot, that is the website to go to.

## Pre-requisites

Complete the [previous guide](getting_started.md).

## Setup

By now you should have turtlebot3 metapackage and turtlebot3-msgs package installed. In this guide we will install the required simulation packages

1. Define your turtlebot 3 model:

    ```bash
    echo -e '\nexport TURTLEBOT3_MODEL=waffle_pi' >> ~/.bashrc && source ~/.bashrc
    ```

2. Install simulation metapackage:

    ```bash
    cd ~/catkin_ws/src/
    git clone https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
    cd ~/catkin_ws && catkin_make
    ```

## Crude simulation

3. Run the Turtlebot 3 fake node:

    ```bash
    roslaunch turtlebot3_fake turtlebot3_fake.launch
    ```

    It should open rviz. Remember that rviz is not simulating the robot, it's only used for visualization and little interaction. The code that simulates this robot is quite small, you can take a look at it with the following command, but you don't need to understand it.

    ```bash
    rosed turtlebot3_fake turtlebot3_fake.cpp
    ```

4. Control the robot with:

    ```bash
    roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
    ```

## Physics-based simulation

For this part we will need to install [Gazebo](http://gazebosim.org/).

5. Install Gazebo 7:

    ```bash
    sudo apt install libgazebo7-dev
    ```

6. Run the simulation:

    ```bash
    roslaunch turtlebot3_gazebo turtlebot3_world.launch
    ```

7. Run collision avoidance:

    ```bash
    roslaunch turtlebot3_gazebo turtlebot3_simulation.launch
    ```

8. Run rviz for visualization

    ```bash
    roslaunch turtlebot3_gazebo turtlebot3_gazebo_rviz.launch
    ```

    Play around! Disable the Camera if your computer gets too slow. It is normal due to Gazebo.

9. You can now explore applications following this guide: http://emanual.robotis.com/docs/en/platform/turtlebot3/simulation/#virtual-slam-with-turtlebot3

10. Use rosbash tools (rostopic, rosnode, etc.) to check that everything is indeed using ROS topics.
