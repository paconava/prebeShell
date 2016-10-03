#!/bin/bash

CYAN="\E[1;36m\E[1m"
NC="\E[m"
BLUE="\E[34m\E[1m"
VIOLET="\E[35m\E[1m"
RED="\E[31m\E[1m"
YELLOW="\E[33m\E[1m"
GREEN="\E[37m\E[32m\E[1m"
TEXT="\E[1;37m\E[1m"

declare -i stackheight=0;
echo -e "\n"
declare -i r=0;
function listf {
    cd "$1";
    for file in *
    do
        if [ "$2" == "$file" ]
        then
        echo -e "${VIOLET}`pwd`/$file${NC}"
        let r=$r+1
        fi
        if [ -d "$file" ]
        then
            stackheight=$stackheight+1;
            listf "$file" "$2";
            cd ..;
        fi
    done
    let stackheight=$stackheight-1;
}
listf "$1" "$2";

unset i color stackheight;

if [ "$r" -eq 0 ]; then
	echo -e "${GREEN}No se encontraron archivos"
	elif [ "$r" -eq 1 ]; then #== -eq <= -le >= -ge < -lt > -gt
		echo -e "${GREEN}Se encontró ${RED}1${GREEN} archivo"
    elif [ "$r" -gt 1 ]; then
        echo -e "${GREEN}Se encontraron ${RED}$r${GREEN} archivos"
fi

echo -e "\n${NC}"
