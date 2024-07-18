#!/bin/sh

source "$CONFIG_DIR/colors.sh"

IP_ADDRESS=$(scutil --nwi | grep address | sed 's/.*://' | tr -d ' ' | head -1)
IS_VPN=$(scutil --nwi | grep -m1 'utun' | awk '{ print $1 }')

if [[ $IS_VPN != "" ]]; then
	COLOR=$ORANGE_COLOR_80
	ICON=
	LABEL="VPN"
elif [[ $IP_ADDRESS != "" ]]; then
	COLOR=$TRANSPARENT
	ICON=
	LABEL=$IP_ADDRESS
else
	COLOR=$WHITE
	ICON=
	LABEL="Not Connected"
fi

sketchybar --set $NAME background.color=$COLOR \
  label.color=$WHITE \
  icon.color=$WHITE \
	icon=$ICON \
	label="$LABEL"