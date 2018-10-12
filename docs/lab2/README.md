Lab 2
==================

The goal for this lab is to get you working hands on with a Turtlebot3 Waffle Pi, and developing low level functionalities using a variety of sensors.

For this lab we are going to work with Gazebo and the real robot.
The following instructions have been tested under Ubuntu 16.04 and ROS kinetic.

If you have any questions, post a new [issue](https://github.com/guilhermelawless/introduction-robotics/issues).

# Setup

Follow the previous [guides](../../index.md) to get started. If at any point you are missing packages, see the comprehensive [Tutorial](http://emanual.robotis.com/docs/en/platform/turtlebot3/overview/) and [ROS Wiki](http://wiki.ros.org/turtlebot3).

You can use the previous lab's [code](../lab1/pioneer_behavior.py) as a skeleton. You will need to change the topic names.

# Real robot connection

The following script will install everything you need in ~/.bashrc . Feel free to cleanup that file of anything related to this course before you run it.

```bash
wget -nH --recursive --no-parent --reject "index.html" https://guilhermelawless.github.io/introduction-robotics/docs/lab1/ --cut-dirs=2 && cd lab2 && bash turtlebot3_ros_setup.sh && cd .. && rm -rf lab2
```

# Tasks

1. Teleoperate the robot (hint: `turtlebot3_teleop` package)

2. Create a new ROS package in your workspace, called `turtlebot3_functionalities`. All your code should be messages, sources and nodes/scripts in this package.

3. Develop a program that will switch between 3 states: moving forward, moving backwards, rotating left.
    - It should switch when a new message is received on a ROS topic that your program subscribes to.
    - Use your own custom message `turtlebot3_functionalities/SwitchState` that should contain at least an integer.
    - Even better if you assign specific names to values 0, 1, and 2 of that integer. See message `sensor_msgs/BatteryState` for an example.
    - Hint: see this [tutorial](http://wiki.ros.org/ROS/Tutorials/CreatingMsgAndSrv)
    - Hint 2: remember that turtlebot3 receives velocities in the `/cmd_vel` topic.

4. Test the program in **3** in Gazebo. Use the **empty** world!

5. Develop a new program that has the robot repeatedly performing a square trajectory (side size: 0.5 meters).
    - Use the node in **3**, publishing messages to it when the robot should switch state to *draw* your square.
    - Subscribe to the robot's [odometry](http://docs.ros.org/melodic/api/nav_msgs/html/msg/Odometry.html) (/odom) topic to know the current value read by the encoders, processed as a [pose](http://docs.ros.org/melodic/api/geometry_msgs/html/msg/Pose.html) since the startup of that node.
    - If you have trouble working with quaternions, you can easily transform to Euler angles with this [method](http://docs.ros.org/jade/api/tf/html/python/transformations.html#tf.transformations.euler_from_quaternion). Simply `import tf` in your python script and use it.

6. Test the program in **4** in Gazebo.

7. Subscribe to the robot's [laser scan](http://docs.ros.org/api/sensor_msgs/html/msg/LaserScan.html) (/scan) topic and use it to avoid obstacles (stop and wait or go around it). Add an obstacle in Gazebo and test.

8. Repeat **5**, **6** and **7** but instead of using odometry, listen to TF messages. Note that you will have to learn about these for future projects.
    - Learn about [tf2](http://wiki.ros.org/tf2).
    - Use [tf2\_tools](http://wiki.ros.org/tf2_tools) for a visual into the tf tree of the robot. Currently there is only one transformation, **odom -> base_footprint**. 
    - Follow this [tutorial](http://wiki.ros.org/tf2/Tutorials/Writing%20a%20tf2%20listener%20%28Python%29) to setup a tf2 listener in python. Use it to get the current pose of the robot, instead of subscribing to odometry.
    - Note: The reason why we use frame transformations instead of raw odometry messages will become clear in the first mini-project.
