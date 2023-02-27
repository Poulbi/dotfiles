#!/bin/bash
while true
do
    string=$(pamixer --get-volume)
    muted=$(pamixer --get-mute)
    if [[ "$muted" == "true" ]] 
    then
      icon=""
    elif [ $string -gt 49 ]
    then
      icon=""
    elif [ $string -eq 0 ]
    then
      icon=""
    elif [ $string -lt 50 ]
    then
      icon=""
    fi
    echo "${string}% $icon" > $HOME/.config/xmobar/scripts/volume-pipe
done
