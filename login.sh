#!/bin/bash

CYAN="\E[1;36m\E[1m"
NC="\E[m"
BLUE="\E[34m\E[1m"
VIOLET="\E[35m\E[1m"
RED="\E[31m\E[1m"
YELLOW="\E[33m\E[1m"
GREEN="\E[37m\E[32m\E[1m"
TEXT="\E[1;37m\E[1m"

chmod -R 777 ./

if [ "$(whoami)" != "root" ]; then
	echo -e "$(echo -e $RED)Permiso Denegado: Debes ser root para iniciar la PREBESHELL$(echo -e $NC)"
	elif [ "$(whoami)" == "root" ]; then #== -eq <= -le >= -ge < -lt > -gt
        echo `clear`

        echo -e "\t${GREEN}Favor de identificarse\n"

        read -p "$(echo -e $BLUE)USUARIO:$(echo -e $NC) " USERNAME

        id -u $USERNAME > /dev/null
        if [ $? -ne 0 ]
        then
                echo -e "${RED}El usuario: $USERNAME no existe en el sistema${NC}"
                exit 1
        else
                #echo
                read -p "$(echo -e $BLUE)CONTRASEÑA:$(echo -e $NC) " -s PASSWD
                export PASSWD
                ORIGPASS=`sudo -S grep -w "$USERNAME" /etc/shadow | cut -d: -f2`
                export ALGO=`echo $ORIGPASS | cut -d'$' -f2`
                export SALT=`echo $ORIGPASS | cut -d'$' -f3`
                GENPASS=$(perl -le 'print crypt("$ENV{PASSWD}","\$$ENV{ALGO}\$$ENV{SALT}\$")')
                if [ "$GENPASS" == "$ORIGPASS" ]
                then
                        ./main.sh $USERNAME
                        exit 0
                else
                        echo -e "\n${RED}Contraseña incorrecta${NC}"
                        exit 1
                fi
        fi
fi
