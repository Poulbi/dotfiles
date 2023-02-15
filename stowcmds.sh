#!/usr/bin/env bash
mkdir "$HOME/bin"
stow -d bin/ -t "$d/bin" common dmscripts extra

mkdir "$HOME/.config"
stow -d config/ -t "$HOME/.config" essentials common extra theme X
stow -d config/ -t "$HOME/" zshrc
