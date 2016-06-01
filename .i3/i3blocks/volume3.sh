#!/usr/bin/bash

amixer -D pulse get Master | grep -E -o '[0-9][0-9]?%'

UTE=$(amixer -D pulse get Master | grep -E -o "\["on]; amixer -D pulse get Master | grep -E -o "\["off])

echo "$UTE" | sed 's:\[::g' | sed 's:\]::g'

#if [ $UTE == '[on]' ]
#then
#	echo "on"
#elif [ $ute == '[off]']
#then
#	echo "off"
#fi

# case 'amixer -D pulse get Master | grep -E -o "\[on]"' in
#		[off]) echo "off" ;;
#		[on]) echo "on" ;;
#	esac
