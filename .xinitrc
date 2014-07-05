#!/bin/bash
amixer set Master mute
xscreensaver -nosplash &
xrdb -merge ~/.Xresources
# xmodmap ~/.Xmodmap
mpd
