#!/bin/bash
# Basic entrypoint for ROS / Catkin Docker containers

# Source ROS and Catkin workspaces
source /opt/ros/noetic/setup.bash
if [ -f /catkin_ws/devel/setup.bash ]
then
  echo "source /catkin_ws/devel/setup.bash" >> ~/.bashrc
  source /catkin_ws/devel/setup.bash
fi
if [ -f /overlay_ws/devel/setup.bash ]
then
  echo "source /overlay_ws/devel/setup.bash" >> ~/.bashrc
  source /overlay_ws/devel/setup.bash
fi
echo "Sourced Catkin workspace!"

# # Set environment variables
# export TURTLEBOT3_MODEL=waffle_pi
# export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:$(rospack find tb3_worlds)/models

# Execute the command passed into this entrypoint
exec "$@"