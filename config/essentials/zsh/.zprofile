#!/bin/sh

if [ "$(id -u)" -ne 0 ]
then
    # if a login tty clear the screen
	[ "${TTY%%tty*}" = '/dev/' ] && clear
    # check if login tty is 2
	case "${TTY#/dev/tty}" in
		2) exec startx > /dev/null 2>&1 ;;
		*) false ;;
	esac && exit
fi
