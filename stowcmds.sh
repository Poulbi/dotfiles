#!/usr/bin/env bash

case in "${MACH:=desktop}"
	'desktop')
		mkdir "$HOME/bin"
		stow -d bin/ -t "$d/bin" -R common dmscripts extra

		mkdir "$HOME/.config"
		stow -d config/ -t "$HOME/.config" -R essentials common extra theme X
		stow -d config/ -t "$HOME/" -R zshrc
		;;
esac
