#!/bin/bash

# Check if a file argument was provided
if [ -z "$1" ]; then
  echo "Error: Please provide a wallpaper file as an argument."
  exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]; then
  echo "Error: File not found: $1"
  exit 1
fi

# Path to your hyprpaper configuration file
hyprpaper_config_file="$HOME/.config/hypr/hyprpaper.conf"

# Update the config file with the new wallpaper path
sed -i -e "s|^preload = .*$|preload = $1|" \
  -e "s|^wallpaper = .*$|wallpaper = ,$1|" \
  "$hyprpaper_config_file"

# Reload hyprpaper
killall -e hyprpaper &
sleep 1
hyprpaper &

# Let the user know it's done
echo "Wallpaper settings in hyprpaper.conf updated successfully."
