#! /usr/bin/env bash

DIR="$HOME/.config/polybar"

killall -q polybar

# wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do
  sleep 1
done

polybar -q main -c "$DIR"/config.ini &
