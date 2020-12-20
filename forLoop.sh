# Usando for loop para recorrer

numbers=({0..100})

echo "Recorriendo un arreglo con for loop"

for number in ${numbers[*]}
do
       echo "Número: $number"
done

echo "Recorriendo cadenas"
for name in "Marco" "Pedro" "Luis" "Daniela"
do 
        echo "Nombres: $name"
done

echo "Iterando archivos"
# Recorre todos los archivos de este directorio
for file in *
do 
        echo "Nombre de archivo: $file"
done

echo "Iterando comandos"

for file in $(ls)
do 
        echo "Nombre archivo: $file"
done

echo "Iterando de manera tradicional" 

for ((i=1; i<10; i++))
do
        echo "Posicion $i"
done
