#!/bin/sh
interval=0
sep="    |    "

cpu() {
  cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)
  printf "CPU  "
  printf "$cpu_val"
}

pkg_updates() {
  #updates=$(doas xbps-install -un | wc -l) # void
  updates=$(checkupdates 2>/dev/null | wc -l) # arch
  # updates=$(aptitude search '~U' | wc -l)  # apt (ubuntu,debian etc)

  if [ -z "$updates" ]; then
    printf "  Fully Updated"
  else
    printf "  $updates"" updates"
  fi
}

mem() {
  printf "  "
  printf "$(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}

wlan() {
	case "$(cat /sys/class/net/wl*/operstate 2>/dev/null)" in
	up) printf "  %s" "Connected" ;;
	down) printf "  %s" "Disconnected" ;;
	esac
}

clock() {
    printf "$(date '+%a %b %d  %I:%m %p')"
}

while true; do
  [ $interval = 0 ] || [ $(($interval % 3600)) = 0 ] && updates=$(pkg_updates)
  interval=$((interval + 1))
  sleep 1
  xsetroot -name "  ${updates}${sep}$(cpu)${sep}$(mem)${sep}$(wlan)${sep}$(clock)  "
done
