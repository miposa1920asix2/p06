#!/bin/bash
#
###COMPROVACIO ARXIU ESECUTA ROOT###
if ((EUID !=0))
then
	zenity --error --text="Requereix d'usuari root"
	exit 1 #Tanca el script si no s'executa com a root
fi
while [true]
do
clear
usuari=$ (zenity --forms -title="Modifica la contrasenya" --text="Digues la nova contraseya i el nou usuari") \
nom=$ (echo $usuari | cut -d '|' -f 1)
contrasenya=$ (echo $usuari | -d '|' 2)
##
$nom:$contrasenya | chpasswd 2 > /dev/null
if [[ $? -ne 0 ]]
then 
	zenity --title="Modifica la contrasenya" --info --text="Contrasenya no modificada" --width=400
else
	zenity --title="Modifica la contrasenya" --info --text="Contrasenya modificada" --widrg=400
	echo ""
	echo "Continuar? S/N"?
	read yn
	case $yn in

exit 1

