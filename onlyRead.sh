# Script para ejemplificar como capturar la informacíon del usuario usando solo read 

# -p: Permite ingresar una frase o prompt antes de pedir el dato.
# -s: Modo Sigiloso. No muestra ningún caracter en la terminal, útil para información sensible.
# -n [num]: Permite leer como máximo n caracteres.
# -r: Toma el botón de retroceso o backspace como un caracter y no borra ningun otro caracter

option=0
backupName=""

echo "Pograma de utilidades postgress"
read -p "Ingresa una opción: " option

read -p "Ingresar el nombre del archivo backup: " backupName


echo "La opción escogida es: $option y el nombre del archivo es $backupName"

