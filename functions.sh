# ! /bin/bash
# Programa para manejo de utilidades de postgres

opciones=0

# funciones del programa
install_postgres() {
  echo "Instalando postgres...."
}

desinstall_postgres() {
  echo "Desinstalando postgres..."
}

make_backup() {
  echo "Sacando respaldo ..."
  echo "Respaldo hecho en: $1"
}

restore_backup() {
  echo "Restaurando respaldo ..."
  echo "Respando realizado del archivo: $1"
}

while :; do
  #limpiamos pantalla
  clear
  # Despeglar el menu de opciones
  echo "---------------------------------------------"
  echo "PGUTIL - Programa de utilidad de postgres"
  echo "---------------------------------------------"
  echo "            MENU PRINCIPAL                   "
  echo "---------------------------------------------"
  echo "1. Instalar Postgres"
  echo "2. Desinstalar Postgres"
  echo "3. Sacar un respaldo"
  echo "4. Restar respaldo"
  echo "5. Salir"
  #Leerlos datos del usuario - capturar informacion
  read -p "ingrese una opcion [1 - 5]: " opciones
  echo -e "\n"
  #Validar opcion ingresada

  case $opciones in
  1)
    install_postgres
    sleep 7
    ;;
  2)
    desinstall_postgres
    sleep 7
    ;;
  3)
    read -p "Ingrese el directorio donde quiere realizar el respaldo " dirBack
    make_backup $dirBack
    sleep 7
    ;;
  4)
    read -p "Ingrese la ruta del archivo a restaurar " dirRest
    restore_backup $dirrest
    sleep 7
    ;;
  5)
    echo -e "\nSaliendo del programa ......"
    exit 0
    ;;
  esac
done
