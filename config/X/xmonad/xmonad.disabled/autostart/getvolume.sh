#!/bin/bash
while true
do
    string=$(pamixer --get-volume)
    muted=$(pamixer --get-mute)
    if [[ "$muted" == "true" ]] 
    then
      icon="<fn=1></fn>"
    elif [ $string -gt 49 ]
    then
      icon="<fn=1></fn>"
    elif [ $string -eq 0 ]
    then
      icon="<fn=1></fn>"
    elif [ $string -lt 50 ]
    then
      icon="<fn=1></fn>"
    fi
    echo "${string}% $icon" > $HOME/.config/xmobar/scripts/volume-pipe
done
