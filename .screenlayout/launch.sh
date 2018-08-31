#!/bin/sh

host=$(hostname)

if [ $host == 'air' ]; then
  xrandr --output eDP1 --off --output DP1 --primary --mode 2560x1440 --scale 1.57x1.57
elif [ $host == 'nexus' ]; then
  xrandr --output HDMI1 --primary --scale 1.57x1.57
fi
