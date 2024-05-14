#!/usr/bin/bash

trap '' 2 #blocks CTRL-C
clear

GREEN="$(tput setaf 2)"
RESET="$(tput sgr0)"
DIRECTORY="/home/feilong"
PS1="${GREEN}${DIRECTORY}${RESET}>" #Terminal prompt string

echo "$PS1 ls -l ${DIRECTORY}"
ls -l ~

echo -n "$PS1 "
read input

if [[ $input != "exit" ]]; then #type `exit` if you want to exit the script
    fswebcam --jpeg 100 web-cam-shot.jpg 2>/dev/null
    for second in $(seq 3 -1 1)
    do
        echo "Intruder."
        sleep $second
    done

    for second in $(seq 1 -0.1 0)
    do
        echo "Intruder."
        sleep $second
    done

    for _ in $(seq 1 20)
    do
        echo "Intruder."
        sleep 0.1
    done

    clear
    kitten icat web-cam-shot.jpg
    echo "You've been owned."

    sleep 3
    mpv --fullscreen --osc=no 'lupin.webm' 2>/dev/null
    trap 2 #restore CTRL-C
    shutdown now #the finale
fi

trap 2 #restore CTRL-C
