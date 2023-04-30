#!/bin/sh

dir="$(xdg-user-dir PICTURES)"
test -d "$dir" &&
	dir="$HOME/pics"

case $1 in
	"-m")
		actwin="$(hyprctl activewindow -j | jq -r '.monitor')"
		actmon="$(hyprctl monitors -j |
			jq -r ".[] | select(.id == $actwin)" |
			jq -r '.name')" 
		grim -o "$actmon" "$dir/screenshots/$(date +%y%m%d_%H_%M_%S.png)"
		;;
	"-f")
		grim "$dir/screenshots/$(date +%y%m%d_%H_%M_%S.png)"
		;;
	"-s")
		grim -g "$(slurp)" "$dir/screenshots/$(date +%y%m%d_%H_%M_%S.png)"
		;;
	"-sc")
		grim -g "$(slurp)" - | wl-copy
		;;
	*)
		exit
		;;
esac
