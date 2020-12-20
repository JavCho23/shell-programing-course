# Script para ejemplificar como capturar la informacíon del usuario usando echo, read y $REPLY 


option=0
backupName=""

echo "Pograma de utilidades postgress"
# Acepta datos de un solo digito
read -n1 -p "Ingresa una opción: " option
echo -e "\n"
read -n10 -p "Ingresar el nombre del archivo backup: " backupName
echo -e "\n"
echo "La opción escogida es: $option y el nombre del archivo es $backupName"
read -s -p "Contraseña:" password
echo -e "\n"
echo "Clave $password"
