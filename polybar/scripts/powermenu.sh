#!/usr/bin/env bash

dir="~/.config/polybar/scripts/rofi"
uptime=$(uptime -p | sed -e 's/up //g')

rofi_command="rofi"

# Options
shutdown=" shutdown"
reboot=" restart"
suspend=" sleep"

# Confirmation
confirm_exit() {
  rofi -dmenu -no-config -i -no-fixed-num-lines -p "Are You Sure? : " \
    -theme $dir/confirm.rasi
}

# # Message
# msg() {
#   rofi -no-config -theme "$dir/message.rasi" -e "Available Options  -  yes / y / no / n"
# }

# Variable passed to rofi
options="$suspend\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | $rofi_command -p "$uptime   " -dmenu -selected-row 0)"
case $chosen in
$shutdown)
  ans=$(confirm_exit &)
  if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
    systemctl poweroff
  else
    exit 0
  fi
  ;;
$reboot)
  ans=$(confirm_exit &)
  if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
    systemctl reboot
  else
    exit 0
  fi
  ;;
$suspend)
  ans=$(confirm_exit &)
  if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
    mpc -q pause
    amixer set Master mute
    systemctl suspend
  else
    exit 0
  fi
  ;;
esac
