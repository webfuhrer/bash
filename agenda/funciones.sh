	#1 Crear usuario
function crearUsuario
{

echo "Introduce el nombre: "
read nombre
echo "Introduce el teléfono: "
read telefono
echo "$nombre,$telefono" >> $ruta
}

	#2 Listar usuarios. En verdad podría haberlo usado para buscar y borrar
function listarUsuarios 
{
	IFS=,
	while read nombre telefono
	do
		echo "NOMBRE: $nombre TELÉFONO: $telefono"
	done < "$ruta"
	unset IFS
}
function buscarUsuario
{
	read -p "Introduce el nombre del contacto" nombre_buscado
	
	nombre=$(cat "$ruta" | grep "$nombre_buscado" | cut -d, -f1)
	telefono=$(cat "$ruta" | grep "$nombre_buscado" | cut -d, -f2)

	
	echo "NOMBRE: $nombre TELÉFONO: $telefono"

}
function borrarUsuario
{
	if [ -z "$1" ]; then
	read -p "Introduce el nombre del contacto" nombre_buscado
	else
		nombre_buscado=$1
	fi
	IFS=,
	while read nombre telefono
	do
		if [ "$nombre" != "$nombre_buscado" ] ; then
			 echo "$nombre,$telefono" >> $ruta_temporal
		fi
	done < $ruta
	cat $ruta_temporal > $ruta
	rm $ruta_temporal
}
function editarUsuario
{
read -p "Introduce el nombre del contacto" nombre_buscado
borrarUsuario $nombre_buscado
IFS=,
read -p "Introduzca el nuevo nombre y teléfono separados por ," nombre telefono
echo "$nombre,$telefono" >> $ruta
unset IFS
}