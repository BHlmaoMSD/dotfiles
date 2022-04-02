#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar -r ws &
polybar -r date &
polybar -r power &
polybar -r audio &
polybar -r arch &
polybar -r cpu &
polybar -r memory &
polybar -r tray &
polybar -r time &

echo "Polybar launched..."
