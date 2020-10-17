#!/bin/bash
source funciones.sh
opcion=0
ruta="agenda.csv"
ruta_temporal="agenda_temporal.csv"
maximo=0
function mostrarMenu {
	i=1
	opcion=0
	while read opcion_textual
	do
		
		echo "$i-$opcion_textual"
		i=$((i+1))
	done <  menu.txt
	i=$((i-1))
	#echo "Maximo: $i"
	maximo=$i
	while [ "$opcion" -lt "1"  ] || [ "$opcion" -gt "$i" ]; do
		read -p "Introduzca la opción" opcion
	done
}
mostrarMenu
while [ "$opcion" -ne "$maximo" ]; do

	clear
	case $opcion in
		#1 Crear usuario
	1) crearUsuario;;
		#2 buscar usuarios
	2) buscarUsuario;;
		#3 Listar usuarios
	3) listarUsuarios ;;
	4) borrarUsuario ;;
	5) editarUsuario ;;
	esac

mostrarMenu
done
echo "Adios, gracias por  usar esta agenda del paleógeno"
	