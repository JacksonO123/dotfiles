#! /usr/bin/env bash

# NOTIFY_ICON=/usr/share/icons/Papirus/32x32/apps/system-software-update.svg
LOG_FILE=/tmp/pbar_checkupdates.log

get_total_updates() {
  # UPDATES=$(/home/jotto/.config/polybar/scripts/checkupdates 2>/dev/null | /usr/bin/wc -l)

  # env >$LOG_FILE 2>&1
  #
  # echo "PATH: $PATH" >>$LOG_FILE
  # echo "HOME: $HOME" >>$LOG_FILE
  # echo "USER: $USER" >>$LOG_FILE

  # export PACMAN_DISABLE_LANDLOCK=1

  UPDATES=$(/usr/bin/checkupdates 2>/dev/null | wc -l)

  # CHECKUPDATES_STATUS_CODE=$?
  # echo "DEBUG: checkupdates exited with code ($CHECKUPDATES_STATUS_CODE)" >>$LOG_FILE
}

while true; do
  get_total_updates

  # notify user of updates
  # if hash notify-send &>/dev/null; then
  #   if ((UPDATES > 50)); then
  #     notify-send -u critical -i $NOTIFY_ICON \
  #       "You really need to update!!" "$UPDATES New packages"
  #   elif ((UPDATES > 25)); then
  #     notify-send -u normal -i $NOTIFY_ICON \
  #       "You should update soon" "$UPDATES New packages"
  #   elif ((UPDATES > 2)); then
  #     notify-send -u low -i $NOTIFY_ICON \
  #       "$UPDATES New packages"
  #   fi
  # fi

  # when there are updates available
  # every 10 seconds another check for updates is done
  while ((UPDATES > 0)); do
    if ((UPDATES == 1)); then
      echo " $UPDATES"
    elif ((UPDATES > 1)); then
      echo " $UPDATES"
    else
      echo " None"
    fi
    sleep 10
    get_total_updates
  done

  # when no updates are available, use a longer loop, this saves on CPU
  # and network uptime, only checking once every 30 min for new updates
  while ((UPDATES == 0)); do
    echo " None"
    sleep 1800
    get_total_updates
  done
done
