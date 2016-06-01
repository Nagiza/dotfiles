#!/usr/bin/env bash

icon="$HOME/.i3/lockicon2.png"
tmpbg='/tmp/screen.png'

(( $# )) && { icon=$1; }

scrot "$tmpbg"
convert "$tmpbg" -scale 5% -scale 2020% "$tmpbg" #dont know why it cant be exactly 2000% because it should work
convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
i3lock -u -i "$tmpbg"
