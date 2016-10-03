#!/bin/bash

CYAN="\E[1;36m\E[1m"
NC="\E[m"
BLUE="\E[34m\E[1m"
VIOLET="\E[35m\E[1m"
RED="\E[31m\E[1m"
YELLOW="\E[33m\E[1m"
GREEN="\E[37m\E[32m\E[1m"
TEXT="\E[1;37m\E[1m"

echo -e "\n"

echo -e "${GREEN}Este sistema operativo es:${NC} `uname -o`"
echo -e "${GREEN}El nombre del kernel es:${NC} `uname -s`"
echo -e "${GREEN}La versión del kernel es:${NC} `uname -v`"
echo -e "${GREEN}El release del kernel es:${NC} `uname -r`"
echo -e "${GREEN}Tipo de procesador:${NC} `uname -p`"

echo -e "\n"
