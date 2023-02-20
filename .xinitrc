#!/bin/sh

killall bars.sh
feh --no-fehbg --bg-fill "${HOME}/.dotfiles/assets/wallpapers/lavender-cat.png" &
wmname LG3D
while pgrep -u $UID -x bars.sh > /dev/null; do sleep 0.1; done
${HOME}/.dotfiles/scripts/bars.sh &
exec dwm
