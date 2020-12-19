# Script para ejemplificar como capturar la informacíon del usuario usando echo, read y $REPLY 


option=0
backupName=""

echo "Pograma de utilidades postgress"
echo -n "Ingresa una opción: "
read
option=$REPLY
echo -n "Ingresar el nombre del archivo backup: "
read
backupName=$REPLY

echo "La opción escogida es: $option y el nombre del archivo es $backupName"

