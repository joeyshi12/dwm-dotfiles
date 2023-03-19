#!/bin/sh
feh --no-fehbg --bg-fill "${HOME}/.dotfiles/assets/wallpapers/lavender-cat.png" &
xset s 3600 # blank screen when inactive for 1 hour
xset -dpms
wmname LG3D
${HOME}/.dotfiles/scripts/bars.sh &
exec dwm
