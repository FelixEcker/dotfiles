#!/bin/bash

# Launch script for Polybar on Dual Monitors

killall polybar -q

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bars
# touch $HOME/polybar_launch.txt &
polybar top_lg   & # &>> $HOME/polybar_launch.txt &
polybar top_acer & # >> $HOME/polybar_launch.txt &
