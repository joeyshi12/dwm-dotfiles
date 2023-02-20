#!/bin/sh
feh --no-fehbg --bg-fill "${HOME}/.dotfiles/assets/wallpapers/lavender-cat.png" &
${HOME}/.dotfiles/scripts/bars.sh &
exec dbus-launch dwm
