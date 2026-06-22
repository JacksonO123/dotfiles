#!/usr/bin/env bash

FILE="$HOME/.config/polybar/glyphs.ini"

# Replace Glyphs
change_style() {
  sed -i -e "s/gleft = .*/gleft = $1/g" $FILE
  sed -i -e "s/gright = .*/gright = $2/g" $FILE

  polybar-msg cmd restart
}

# Launch Rofi
MENU="$(rofi -no-config -no-lazy-grab -sep "|" -dmenu -i -p '' \
  -theme $HOME/.config/polybar/scripts/rofi/styles.rasi \
  <<<"   Style-1|   Style-2|   Style-3|   Style-4|   Style-5|")"
case "$MENU" in
## Light Colors
*Style-1) change_style   ;;
*Style-2) change_style   ;;
*Style-3) change_style   ;;
*Style-4) change_style   ;;
*Style-5) change_style   ;;
esac
