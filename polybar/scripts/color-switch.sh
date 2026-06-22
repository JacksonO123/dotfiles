#!/usr/bin/env bash

SDIR="$HOME/.config/polybar/scripts"

# Launch Rofi
MENU="$(rofi -no-lazy-grab -sep "|" -dmenu -i -p '  ' \
  <<<" navy| amber| blue| blue-gray| brown| cyan| deep-orange|\
 deep-purple| green| gray| indigo| blue-light|\
 green-light| lime| orange| pink| purple| red| teal| yellow|")"
case "$MENU" in
*navy) "$SDIR"/colors-dark.sh --navy ;;
*amber) "$SDIR"/colors-dark.sh --amber ;;
*blue) "$SDIR"/colors-dark.sh --blue ;;
*blue-gray) "$SDIR"/colors-dark.sh --blue-gray ;;
*brown) "$SDIR"/colors-dark.sh --brown ;;
*cyan) "$SDIR"/colors-dark.sh --cyan ;;
*deep-orange) "$SDIR"/colors-dark.sh --deep-orange ;;
*deep-purple) "$SDIR"/colors-dark.sh --deep-purple ;;
*green) "$SDIR"/colors-dark.sh --green ;;
*gray) "$SDIR"/colors-dark.sh --gray ;;
*indigo) "$SDIR"/colors-dark.sh --indigo ;;
*blue-light) "$SDIR"/colors-dark.sh --light-blue ;;
*green-light) "$SDIR"/colors-dark.sh --light-green ;;
*lime) "$SDIR"/colors-dark.sh --lime ;;
*orange) "$SDIR"/colors-dark.sh --orange ;;
*pink) "$SDIR"/colors-dark.sh --pink ;;
*purple) "$SDIR"/colors-dark.sh --purple ;;
*red) "$SDIR"/colors-dark.sh --red ;;
*teal) "$SDIR"/colors-dark.sh --teal ;;
*yellow) "$SDIR"/colors-dark.sh --yellow ;;
esac
