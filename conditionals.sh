# Programa para practicar las expresiones condicionales en bash

echo "Información basica"
read -p "Ingrese su edad: " age
read -p "Ingrese su pais: " country
read -p "Ingrese el path de su archivo: " file

echo "Expresiones condicionales"

if [ $age -lt 10 ]; then
        echo "Eres un niño o niña"
elif [ $age -ge 10 ] && [ $age -le 17 ]; then
        echo "Eres un adolescente"
else
        echo "Eres mayor de edad"
fi

echo "Expresiones condicionales con cadenas"

if [ $country = "PERU" ]; then
        echo "Eres peruan@"
elif [ $country = "ECUADOR" ] || [ $country = "COLOMBIA" ]; then
        echo "Eres latino"
else echo "No se que eres"
fi

echo "Expresiones condicionales con archivos"

if [ -d $file ]; then
        echo "El directorio $file existe"
else echo "El directorio no existe"
fi
