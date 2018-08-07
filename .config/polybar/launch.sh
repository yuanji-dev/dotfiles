#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

wlan=$(iw dev | awk '$1=="Interface"{print $2}')

if type "xrandr"; then
  for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m WLAN=$wlan polybar --reload bar &
  done
else
  polybar --reload bar &
fi

echo "Bars launched..."
