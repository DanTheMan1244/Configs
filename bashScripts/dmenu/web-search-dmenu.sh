#!/usr/local/env bash

WEBBROWSER="firefox"

declare -a options=(
"duckduckgo - https://duckduckgo.com/?q="
"archwiki - https://wiki.archlinux.org/title/"
"archaur - https://aur.archlinux.org/packages/?O=0&k"
"archpkg - https://archlinux.org/packages/?sort=&q="
"youtube - https://www.youtube.com/results?search_query="
"google - https://www.google.com/search?q="
"amazon - https://www.amazon.com/s?k="
"quit"
)

while [ -z "$engine" ]; do
enginelist=$(printf '%s\n' "${options[@]}" | dmenu -i -l 20 -p 'Choose search engine:') || exit
engineurl=$(echo "$enginelist" | awk '{print $NF}')
engine=$(echo "$enginelist" | awk '{print $1}')
done

while [ -z "$query" ]; do
query=$(echo "" | dmenu -i -p "Searching $engine:") || exit
done

$WEBBROWSER "$engineurl""$query"
	
