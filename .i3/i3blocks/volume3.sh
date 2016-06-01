#!/bin/bash

STATUS=`amixer -D pulse get Master | tail -n 1`
MUTE=`echo "${STATUS}" | grep -wo "on"; echo "${STATUS}" | grep -wo "off"`


#MUTE=`amixer -D pulse get Master | grep -wo "on"; amixer -D pulse get Master | grep -wo "off"`

#UTE=`echo "$MUTE" | sed 's:\[::g' | sed 's:\]::g' | uniq`

VOL=`amixer -D pulse get Master | grep -E -o '[0-9][0-9][0-9]?%' | uniq`

#amixer -D pulse get Master | grep -E -o "\["on] | sed 's:\[::g' | sed 's:\]::g' | uniq

#echo "$VOL"
echo "$MUTE""  ""$VOL"

#if [[ "$MUTE" == "on" ]]; then
#    echo "n" #echo speaker symbol
#else
#    echo "f" #echo speaker off symbol
#fi

