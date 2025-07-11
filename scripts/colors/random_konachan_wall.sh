#!/usr/bin/env bash

mkdir -p ~/Imagens/Wallpapers
page=$((1 + RANDOM % 1000))
response=$(curl "https://konachan.com/post.json?tags=rating%3Asafe&limit=1&page=$page")
link=$(echo "$response" | jq '.[0].file_url' -r)
ext=$(echo "$link" | awk -F. '{print $NF}')
downloadPath="$HOME/Imagens/Wallpapers/konachan_random_image.$ext"
curl "$link" -o "$downloadPath"
~/.config/quickshell/scripts/colors/switchwall.sh --image "$downloadPath"
# ~/.config/quickshell/scripts/colors/switchwall.sh --image "$HOME/Imagens/Wallpapers/hell3.png"
