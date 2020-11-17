#!/bin/bash
#
#=====================================
#
# Autor: wrrulos
# CITTZ es una herramienta de recuperacion de contraseñas wifi
# Version: 1.1
# Github: https://github.com/wrrulos/cittz
#
# Discord: Rulo#9224
# Instagram: @wrrulos
# Twitter: @wrrulos
#
#=====================================
#
# WFYCO - Waiting for you come out
#
# Discord: discord.gg/HtCHzDV
# Instagram: @wfyco_team
# Twitter: @wfyco_team
#
#=====================================


# ================
#  Menu principal
# ================

menu() { 

clear

echo -e "\e[93m             ____ ___ _____ _____ _____"
echo -e "\e[93m            / ___|_ _|_   _|_   _|__  /"
echo -e "\e[93m           | |    | |  | |   | |   / / "
echo -e "\e[93m           | |___ | |  | |   | |  / /_ "
echo -e "\e[93m            \____|___| |_|   |_| /____|  \e[92mv1.2 "
echo -e ""
echo -e "\e[94m    Herramienta de recuperacion de contraseñas wifi"
echo ""
echo -e "      \e[93m [1] \e[95mVer contraseña de una red"
echo -e "      \e[93m [2] \e[95mExportar contraseñas de todas las redes"
echo -e "      \e[93m [3] \e[95mGithub de la herramienta "
echo -e "      \e[93m [99] \e[95mSalir "
echo -e ""

}

preguntamenu() {

echo ""
printf "\e[93m [-] \e[95mElije una opcion [1-3]\e[0m \e[93m➜ \e[0m" 

read opciones

if [ "$opciones" == "1" ]; then

	opcion1

elif [ "$opciones" == "2" ]; then
	
	opcion2

elif [ "$opciones" == "3" ]; then
	
	opcion3

elif [ "$opciones" == "99" ]; then
	
	echo ""
	exit	

else 
	echo ""
	echo ""
	echo -e " \e[91m⊗   ERROR! \e[39mEscribe una opcion valida.\e[0m"
	echo ""
	sleep 3
	menu
	preguntamenu
fi

}

echo ""

# ==========
#  Opcion 1
# ==========

opcion1() {

	clear

	echo""
	echo -e "		\e[92m[CITTZ | OPCION 1]\e[0m   " 

	sleep 1

	echo ""
	echo ""
	echo -e "\e[93m[＊] \e[95mRedes WiFI disponibles: "
	echo ""

	cd /etc/NetworkManager/system-connections

	opcion1ls=`ls` 

	echo -e "\e[96m$opcion1ls"
	echo ""
	printf "\e[93m[＊] \e[95mEscribe una de las redes Wifi (Ejemplo wifi-wfyco.nmconnection)\e[0m \e[93m➜ \e[96m" 

	read opcion1red

	opcion1pwd=`grep psk= $opcion1red`

	if [ "$?" == "2" ]; then

			echo ""
			echo -e " \e[91m⊗   ERROR!\e[39m Escribe una red wifi valida.\e[0m"
			echo ""
			sleep 3
			opcion1

	fi

	opcion1parte2

}

opcion1parte2() {

	echo ""

	echo -e "\e[93m════════════════════════════════════════════════════════════════════════════"
	echo -e " \e[92mred=$opcion1red "
	echo -e " \e[92m$opcion1pwd"
	echo -e "\e[93m════════════════════════════════════════════════════════════════════════════"
	echo ""

	printf "\e[93m[＊] \e[95mGuardar resultados en un archivo de texto? S/N \e[93m➜ \e[0m" 

	read opcion1guardar

	if [ "$opcion1guardar" == "S" ]; then

		cd $ubicacion

		echo "CITTZ | Hecho por wrrulos" > $opcion1red.txt
		echo "" >> $opcion1red.txt
		echo "════════════════════════════════════════════════════════════════════════════" >> $opcion1red.txt
		echo " red=$opcion1red " >> $opcion1red.txt 
		echo " $opcion1pwd" >> $opcion1red.txt
		echo "════════════════════════════════════════════════════════════════════════════" >> $opcion1red.txt

		chmod 777 $opcion1red.txt -R

		echo ""
		echo -e "\e[93m[✔] \e[95mGuardado en $ubicacion/$opcion1red.txt "
		echo ""
		sleep 2
		menu
		preguntamenu

	elif [ "$opcion1guardar" == "s" ]; then

		cd $ubicacion

		echo "CITTZ | Hecho por wrrulos" > $opcion1red.txt
		echo "" >> $opcion1red.txt
		echo "════════════════════════════════════════════════════════════════════════════" >> $opcion1red.txt
		echo " red=$opcion1red " >> $opcion1red.txt
		echo " $opcion1pwd" >> $opcion1red.txt
		echo "════════════════════════════════════════════════════════════════════════════" >> $opcion1red.txt

		chmod 777 $opcion1red.txt -R

		echo ""
		echo -e "\e[93m[✔] \e[95mGuardado en $ubicacion/$opcion1red.txt"
		echo ""
		sleep 2
		menu
		preguntamenu

	elif [ "$opcion1guardar" == "N" ]; then

		echo ""
		echo -e "\e[93m[＊] \e[95mVolviendo al menu.."
		menu
		preguntamenu


	elif [ "$opcion1guardar" == "n" ]; then

		echo ""
		echo -e "\e[93m[＊] \e[95mVolviendo al menu.."
		menu
		preguntamenu

	else

		echo ""
		echo ""
		echo -e " \e[91m⊗   ERROR!\e[39m Escribe una opcion valida.\e[0m"
		echo ""
		sleep 2
		clear
		opcion1parte2


	fi

}

# ==========
#  Opcion 2
# ==========

opcion2(){

	clear

	cd /etc/NetworkManager/system-connections
	echo "CITTZ | Hecho por wrrulos" > claves.txt
	echo "" >> claves.txt
	grep psk= *.* >> claves.txt
	mv claves.txt $ubicacion
	cd $ubicacion/
	chmod 777 claves.txt -R
	clear
	echo ""
	echo -e "\e[93m[＊] \e[95mGuardado en $ubicacion/claves.txt"
	echo ""
	sleep 3
	menu
	preguntamenu
}

# ==========
#  Opcion 3
# ==========

opcion3() {

	clear
	echo ""
	echo -e "        \e[36m\e[4mGithub de la herramienta:\e[0m \e[91m\e[4mhttps://github.com/wrrulos/cittz\e[0m"
	sleep 5
	menu
	preguntamenu
}

# ================================
#  Verifica si el usuario es root
# ================================

if ! [ $(id -u) = 0 ]; then

	echo -e "\e[91m[✘] Se necesita ser root para ejecutar\e[39m CITTZ\e[0m"
	echo ""
	exit

fi

# ================================
#  Guarda la ubicacion del script
# ================================

ubicacion=`pwd`

menu

preguntamenu
