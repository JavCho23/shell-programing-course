# Programa que demuestra la utlización de arrays

numbers=(1 2 3 4 5 6 7)
strings=(Marco, Antonio, "Javier Arturo")
ranks=({A..Z} {10..20})

echo "Valores de los arreglos"
echo "Números"
echo "${numbers[*]}"
echo "Strings"
echo "${strings[*]}"
echo "Rangos"
echo "${ranks[*]}"

echo "Tamaño de los arreglos"

echo "El tamaño del arreglo de numeros es ${#numbers[*]}"
echo "El tamaño del arreglo de strings es ${#strings[*]}"
echo "El tamaño del arreglo de los rangos es ${#ranks[*]}"

echo "Un elemento del arreglo"

echo "El tercer elemento de los numeros es ${numbers[3]}"
echo "El tercer elemento de los strings es ${stirngs[3]}"

echo "Agregar elementos a un arreglo"
# Si le ponemos 10 en vez de 8, igual se pone en la posicion 8
numbers[8]=50
unset numbers[0]
echo "El tamaño del arreglo de numeros es ${#numbers[*]}"
echo "Números"
echo "${numbers[*]}"

