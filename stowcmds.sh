#!/usr/bin/env bash
d="$1"

mkdir "$d/bin"
stow -d bin/ -t "$d/bin" common dmscripts extra zshrc

mkdir "$d/.config"
stow -d config/ -t "$d/.config" essentials common extra theme X

stow -d config/ -t "$d/" zshrc
