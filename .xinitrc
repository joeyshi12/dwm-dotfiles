#!/bin/sh
feh --no-fehbg --bg-fill "${HOME}/.dotfiles/assets/wallpapers/lavender-cat.png" &
${HOME}/.dotfiles/scripts/bars.sh &
wmname LG3D

xset s 3600 # blank screen when inactive for 1 hour
xset -dpms

exec dwm
