#!/bin/sh

host=$(hostname)

if [ $host == 'air' ]; then
  xrandr --output eDP1 --scale 2x2 --output DP1 --primary --scale 1.57x1.57
elif [ $host == 'nexus' ]; then
  xrandr --output HDMI1 --primary --scale 1.57x1.57
elif [ $host == 'xps' ]; then
  # DPI 192 / 240 = 0.8
  #xrandr --output eDP1 --primary --mode 3840x2160 --scale 0.8x0.8
  # xrandr --output eDP1 --primary --mode 3840x2160 --pos 0x2160 --output DP2 --mode 2560x1440 --scale 1.5x1.5 --pos 0x0
  setxkbmap -option 'ctrl:swapcaps'
  xinput set-prop "DELL07E6:00 06CB:76AF Touchpad" "libinput Natural Scrolling Enabled" 1
  xinput set-prop "DELL07E6:00 06CB:76AF Touchpad" "libinput Tapping Enabled" 1
  xinput set-prop "Designer Mouse" "libinput Left Handed Enabled" 1
  libinput-gestures-setup restart
fi
