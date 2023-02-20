#!/bin/sh
feh --no-fehbg --bg-fill "${HOME}/.dotfiles/assets/wallpapers/lavender-cat.png" &
${HOME}/.dotfiles/scripts/bars.sh &
export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit
wmname LG3D
exec dbus-launch dwm
