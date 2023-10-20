#!/bin/sh

dir="$(xdg-user-dir PICTURES)"
dir="${dir:-$HOME/pics}/screenshots"
date="$(date +%y%m%d_%H_%M_%S)"
mkdir -p "$dir"

case $1 in
	"-m") grim -o "$(hyprctl monitors -j |
			jq -r ".[] | select(.id == $(hyrctl activewindow -j | jq -r '.monitor'))" |
			jq -r '.name')" "$dir/${date}_mon.png" ;;
	"-f") grim "$dir/${date}_full.png" ;;
	"-s") grim -g "$(slurp)" "$dir/${date}_sel.png" ;;
	"-sc") grim -g "$(slurp)" - | wl-copy ;;
	*) exit ;;
esac
