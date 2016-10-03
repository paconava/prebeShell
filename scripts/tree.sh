#!/bin/bash

color="on";

declare -i stackheight=0;
echo -e "\n"

function listf {
    cd "$1";
    for file in *
    do
        for ((i=0; $i < $stackheight; i++))
        do
            printf "\E[1;36m\E[2m|+++\E[m";
        done
        if [ -d "$file" ]
        then
            if [ $color == "on" ]
            then
                printf "\e[34m/";
            fi
        fi
        printf "$file\e[0m\n";
        if [ -d "$file" ]
        then
            stackheight=$stackheight+1;
            listf "$file";
            cd ..;
        fi
    done
    let stackheight=$stackheight-1;
}
listf "$1";

unset i color stackheight;

echo -e "\n"
