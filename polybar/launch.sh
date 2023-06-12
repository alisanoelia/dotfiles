#!/usr/bin/sh

## Add this to your wm startup file.

# Terminate already running bar instances
pkill polybar

## Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

## Launch

## Left bar
polybar workspaces -c ~/.config/polybar/config.ini &

## Right bar
polybar date -c ~/.config/polybar/config.ini &
polybar wlan -c ~/.config/polybar/config.ini &
polybar battery -c ~/.config/polybar/config.ini &
polybar keyboard -c ~/.config/polybar/config.ini &
polybar alsa -c ~/.config/polybar/config.ini &

## Center bar
polybar xwindow -c ~/.config/polybar/config.ini &

