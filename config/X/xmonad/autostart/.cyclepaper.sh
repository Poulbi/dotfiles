#!/bin/bash

wallpaper_dir="$HOME/Pictures/Wallpapers/nord"

interval="15m"

wallpapers=($(ls $wallpaper_dir))
wp_count=${#wallpapers[@]}
i=0

while true; do
    feh --bg-scale $wallpaper_dir/${wallpapers[$i]}
    ((i++))
    if [ $i -eq $wp_count ]
    then
        i=0
    fi
    sleep $interval
done
