#!/bin/sh

File="$1"
OutputDir="$(dirname "$File")"
OutputFile="$(basename "$File")"
ActiveWindowName="$(xprop -id "$(xdotool getactivewindow)" WM_CLASS | awk -F '"' '{print $(NF-1)}')"

if [ "$ActiveWindowName" ]
then
	OutputFileName="${ActiveWindowName}_${OutputFile#Replay_}"
	mv "$File" "$OutputDir"/"$OutputFileName"
	notify-send '*replay.sh' "saved: $OutputFileName"
fi
