#!/bin/sh

host=$(hostname)

if [ $host == 'air' ]; then
  xrandr --output eDP1 --scale 2x2 --output DP1 --primary --scale 1.57x1.57
elif [ $host == 'nexus' ]; then
  xrandr --output HDMI1 --primary --scale 1.57x1.57
elif [ $host == 'xps' ]; then
  # DPI 192 / 240 = 0.8
  xrandr --output eDP1 --primary --mode 3840x2160 --scale 0.8x0.8
  xinput set-prop "DELL07E6:00 06CB:76AF Touchpad" 285 1
  xinput set-prop "DELL07E6:00 06CB:76AF Touchpad" 293 1
  xinput set-prop "Designer Mouse Mouse" 307 1
  libinput-gestures-setup restart
fi
