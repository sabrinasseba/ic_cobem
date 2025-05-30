#!/bin/bash

# Copyright (c) 2021 taurob GmbH. All rights reserved. Confidential.
# Perfektastrasse 57/7, 1230 Wien, Austria. office@taurob.com

# File created 9.1.2019

# This script installs the required packages for needed for the taurob_robots_description package and to rund
# the gazebo simulation.

# roboticsgroup_gazebo_plugins is required for the mimic plugin joint.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
SRC_DIR=${DIR%/*/*}
CATKIN_DIR=${DIR%/*/*/*}

DIRECTORYROBOTICSGROUP="roboticsgroup_gazebo_plugins"


for pkg in $DIRECTORYROBOTICSGROUP; do
   echo -e "$SRC_DIR/$DIRECTORYROBOTICSGROUP"
   if [ -d "$SRC_DIR/$DIRECTORYROBOTICSGROUP" ]; then
      	echo -e "$SRC_DIR/$DIRECTORYROBOTICSGROUP exsists already. The mimic joint plugin should work."
   else
	echo -e "$SRC_DIR/$DIRECTORYROBOTICSGROUP Installing ..."
	git clone https://github.com/roboticsgroup/roboticsgroup_gazebo_plugins.git $SRC_DIR/roboticsgroup_gazebo_plugins	
	cd $CATKIN_DIR
	catkin_make
   fi
done

