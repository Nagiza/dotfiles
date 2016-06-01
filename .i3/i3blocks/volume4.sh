#!/bin/bash
#######
## From www.github.com/Anachron/i3blocks
## Only small changes modifications made so it fits my system
#######
# Left click
if [[ "${BLOCK_BUTTON}" -eq 1 ]]; then
    amixer -qD pulse sset Master 5%+
    # Middle click
elif [[ "${BLOCK_BUTTON}" -eq 2 ]]; then
    amixer -qD pulse sset Master toggle
    # Right click
elif [[ "${BLOCK_BUTTON}" -eq 3 ]]; then
    amixer -qD pulse sset Master 5%-
fi

statusLine=$(amixer -D pulse get Master | tail -n 1)
status=$(echo "${statusLine}" | grep -wo "on")
volume=$(echo "${statusLine}" | awk -F ' ' '{print $5}' | tr -d '[]%')

if [[ "${status}" == "on" ]]; then
    echo "${volume}%"
    echo "${volume}%"
    echo ""
else
    echo "off"
    echo "off"
    echo ""
fi
