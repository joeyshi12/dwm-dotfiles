#!/bin/sh
interval=0
sep=" | "

disk() {
    printf "󰋊  $(df -h / | awk ' /[0-9]/ {print $3 "/" $2}')"
}

cpu() {
    cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)
    printf "CPU $cpu_val"
}

pkg_updates() {
    updates=$(checkupdates 2>/dev/null | wc -l) # arch

    if [ -z "$updates" ]; then
        printf "  Fully Updated"
    else
        printf " $updates"" updates"
    fi
}

mem() {
    printf " $(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}

volume() {
    volume=$(pulsemixer --get-volume | cut -d' ' -f1)
    if [ "$volume" -lt 33 ]; then
        printf "󰕿  "
    elif [ "$volume" -lt 66 ]; then
        printf "󰖀  "
    else
        printf "󰕾  "
    fi
    printf "$volume"
}

wlan() {
    case "$(cat /sys/class/net/wl*/operstate 2>/dev/null)" in
        up) printf "  %s" "Connected" ;;
        down) printf "󰖪  %s" "Disconnected" ;;
    esac
}

clock() {
    printf "$(date '+%a %b %d %I:%M %p')"
}

while true; do
    if [ $interval = 0 ] || [ $(($interval % 3600)) = 0 ]; then
        updates=$(pkg_updates)
    fi
    if [ $interval = 0 ] || [ $(($interval % 10)) = 0 ]; then
        disk_space=$(disk)
        memory=$(mem)
    fi
    interval=$((interval + 1))
    sleep 0.1
    xsetroot -name "  ${updates}${sep}$(cpu)${sep}${memory}${sep}${disk_space}${sep}$(volume)${sep}$(wlan)${sep}$(clock)  "
done
