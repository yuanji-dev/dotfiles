#!/bin/sh

host=$(hostname)

if [ $host == 'air' ]; then
  xrandr --output eDP1 --primary --scale 1.4x1.4 --below DP1 --output DP1 --mode 2048x1080
elif [ $host == 'nexus' ]; then
  xrandr --output HDMI1 --primary --scale 1.57x1.57
fi
