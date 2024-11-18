#!/bin/sh

[ "${TTY%%tty*}" = '/dev/' ] && clear

if [ "$FROMLY" ] && [ "$(id -u)" -ne 0 ]; then
    exec startx > /dev/null 2>&1
    exit
fi
