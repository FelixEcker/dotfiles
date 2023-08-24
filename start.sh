#!/bin/sh
polybar top_lg &
polybar top_acer &
nitrogen --restore &
sh .screenlayout/layout.sh
xbindkeys
picom &
