#!/bin/bash

sketchybar --add item front_app left \
           --set front_app       background.color=$ACCENT_COLOR_BG \
                                 icon.color=$ACCENT_COLOR_ACTIVE \
                                 icon.font="sketchybar-app-font:Regular:16.0" \
                                 label.color=$ACCENT_COLOR_ACTIVE \
                                 script="$PLUGIN_DIR/front_app.sh"            \
           --subscribe front_app front_app_switched
