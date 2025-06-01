#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
#while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
sleep 1

# Launch Polybar, using default config location ~/.config/polybar/config
polybar main --config=~/.config/polybar/config.ini &
#polybar second --config=~/.config/polybar/config.ini &

echo "Polybar launched..."