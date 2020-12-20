# Programa para validar la captura de datos del usuario

# Un tema a considerar es que bash no reconoce la clase \d
dniRegex='^[0-9]{8}$'
countryRegex='EC|COL|US|PE'
birthdayRegex='^[0-9]{4}(0[0-9]|1[0-2])([0-2][0-9]|3[0-1])$'

echo "Expresiones regulares"
read -p "Ingresa tu DNI " dni
read -p "Ingresa tu código de pais " country
read -p "Ingresa tu fecha de nacimiento " birthday

# Validacion de los datos
# echo -n se usa para imprimir en una sola linea
echo -n "El dni es "
if [[ $dni =~ $dniRegex ]]; then
        echo "valido"
else echo "invalido"
fi

echo -n "El código de pais es "
if [[ $country =~ $countryRegex ]]; then
        echo "valido"
else echo "invalido"
fi

echo -n "La fecha de nacimiento es "
if [[ $birthday =~ $birthdayRegex ]]; then
        echo "valida"
else echo "invalida"
fi
