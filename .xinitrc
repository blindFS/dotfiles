#!/bin/bash
amixer set Master unmute
xscreensaver -nosplash &
xrdb -merge ~/.Xresources
# xmodmap ~/.Xmodmap
mpd
