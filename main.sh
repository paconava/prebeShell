#!/bin/bash

CYAN="\E[1;36m\E[1m"
NC="\E[m"
BLUE="\E[34m\E[1m"
VIOLET="\E[35m\E[1m"
RED="\E[31m\E[1m"
YELLOW="\E[33m\E[1m"
GREEN="\E[37m\E[32m\E[1m"
TEXT="\E[1;37m\E[1m"


echo `clear`
DIRACT="$PWD"
morro=$1
estado=1

PRONTO="$(echo -e $YELLOW)$(whoami):$(echo -e $BLUE)`pwd`-->$(echo -e $NC)"
echo -e "\t\t${VIOLET}---- Bienvenido${YELLOW} $morro ---- ${NC}"
echo -e "\n\t${RED}Bienvenido a nuestra PrebeSHELL\n\tUtiliza el comando ayuda para comenzar${NC}\n"

until [ $estado -eq 0 ];
do
	trap '' 2
	trap '' SIGTSTP
	read -p "$(echo -e $YELLOW)$morro:$(echo -e $BLUE)`pwd`-->$(echo -e $NC)" -e cmd
	trap 2
	trap SIGTSTP
	read -r col1 col2 col3 <<< "$cmd"
	case $col1 in
		arbol)
		$DIRACT/scripts/tree.sh
		;;
		ayuda)
		$DIRACT/scripts/ayuda.sh
		;;
		infosis)
		$DIRACT/scripts/infosis.sh
		;;
		fecha)
		$DIRACT/scripts/fecha.sh
		;;
		hora)
		$DIRACT/scripts/hora.sh
		;;
		creditos)
		$DIRACT/scripts/creditos.sh
		;;
		gato)
		$DIRACT/scripts/gato.sh
		;;
		busca)
		$DIRACT/scripts/buscame.sh $col2 $col3
		;;
		prebeplayer)
		RESPUESTA=$(dpkg --get-selections | grep -w mpg123 | grep -w install)
		if [ "$RESPUESTA" = "" ]; then
			echo -e "\n\n El mpg123 no esta instalado. Deseas instalarlo ? \n\n"
			select eleccion in "Si" "No"
			do
				case $eleccion in 
				  	Si)
					sudo apt-get install mpg123
					echo -e "\n El mpg123 esta instalado."
					;;
					No)
					echo -e "¡Hasta luego!"
					;;
				esac
			done
		else

			cd /home/$morro/Música/
			op1="Reproduce la carpeta actual";
			op2="Entrar a una carpeta";
			op3="Subir una carpeta";
			op4="Lista archivos y subcarpetas de la carpeta actual";
			op5="Opciones del reproductor";
			op6="Salir";
			 
			salida=1
			 
			while [ $salida -eq 1 ]; do
				echo "Esas en la carpeta: " `pwd`
				select MENU in  "$op1" "$op2" "$op3" "$op4" "$op5" "$op6"
				do
					case $MENU in 
					    "$op1")
						    mpg123 -C *

					        break
					        ;;
					    "$op2")
							read -p "Carpeta: " carp
					        cd ${carp}
					        echo `clear`

					        break
					        ;;
					    "$op3")
					        cd ..
							break
							echo `clear`

					        ;;
					    "$op4")
							echo `clear`
					        $DIRACT/scripts/tree.sh
					        break
					        ;;
					    "$op5")
							clear
					        OLDIFS=$IFS
							IFS=$'\n'
							for linea in $(cat $2/opciones.txt) ; do
							  echo ${linea}
							done
							IFS=$OLDIFS
							echo "\n\n"
					        break
					        ;;
					    "$op6")
							salida=0;
					        cd $DIRACT
					        echo `clear`
					        break
					        ;;
					esac
				done 
			done
		fi
		;;
		salir)
		estado=0
		echo `clear`
		;;
		*)
		$cmd
		;;
	esac
done



