#!/bin/bash
# Pgrama para declarar varibles
opcion='Una opcion'
nombre='Javier'
echo "Opción: $opcion y Nombre: $nombre"

# Exportar la variable nombre para que este disponible a los demas procesos
export  nombre

# Llamar al siguiente script
./declarandoVariables.sh
