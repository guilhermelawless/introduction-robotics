
export ROS_MASTER_URI=http://localhost:11311
export ROS_HOSTNAME=localhost

export TURTLEBOT3_MODEL=waffle_pi
export TURTLEBOT3_NAME=turtle${TURTLEBOT3_NUMBER}
export TURTLEBOT3_IP=192.168.0.${TURTLEBOT3_NUMBER}

# Helper functions to connect to robot
source ~/.bash_utils.sh
MY_IP=`get_interface_that_pings ${TURTLEBOT3_IP} | get_ip_of_interface`
alias TURTLE="ssh user@$TURTLEBOT3_IP"
alias EXPORT_TURTLE="export ROS_MASTER_URI=http://${TURTLEBOT3_IP}:11311 && export ROS_IP=${MY_IP} && export ROS_HOSTNAME=${MY_IP}"
