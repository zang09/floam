#!/bin/bash
 
set -e

# Ros build
source "/opt/ros/melodic/setup.bash"
source "/home/catkin_ws/devel/setup.bash"

echo "==============Docker Env Ready================"

cd /home/container/catkin_ws

exec "$@"
