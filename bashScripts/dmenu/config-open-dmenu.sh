#!/usr/bin/env bash

EDITOR="alacritty -e vim"

declare -a options=(
"qtile - $HOME/.config/qtile/config.py"
"bash - $HOME/.bashrc"
"picom - $HOME/.config/picom/picom.conf"
"quit"
)

choice=$(printf '%s\n' "${options[@]}" | dmenu -i -l 10 -p 'Edit config:')

if [[ "$choice" == "quit" ]]; then
	echo "Program terminated." && exit 1

elif [ "$choice" ]; then
	cfg=$(printf '%s\n' "${choice}" | awk '{print $NF}')
	$EDITOR "$cfg"
else
	echo "Program terminated." && exit 1
fi
