#!/usr/bin/env bash
cd $HOME/.config/xmonad/autostart/
for script in *.sh
do
    if [ "./$script" != "$0" ] && [ -z "$(ps aux | grep "$script" | head -n -1)" ] 
    then
        echo "started $script"
        setsid ./$script &
    fi
done
