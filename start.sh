#!/bin/sh

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

polybar &
nitrogen --restore &
picom &
