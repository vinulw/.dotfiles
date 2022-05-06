#!/bin/bash

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

# Set display
run "$HOME"'/.screenlayout/default_layout.sh'

# Transparency
run "compton"
#
# Utils
#dropbox
run "indicator-sound-switcher"

# Restore wallpaper
feh --bg-scale $HOME/Pictures/Wallpapers/mountain.jpg --bg-fill $HOME/Pictures/Wallpapers/mountain.jpg
