# ! /bin/bash
# Programa para manejo de utilidades de postgres

opciones=0

# funciones del programa
install_postgres() {
  echo -e "\n Verificar instalación de postgres ...."
  verifyInstall=$(which psql)
  if [ $? -eq 0 ]; then
    echo -e "\n Postgres ya se encuentra instalado en el equipo"
  else
    read -s -p "Ingresar contraseña de sudo: " password
    read -s -p "Ingresar contraseña a utilizar en postgres: " passwordPostgres
    echo "$password" | sudo -S apt update
    echo "$password" | sudo -S apt-get -y install postgresql postgresql-contrib
    sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD '{$passwordPostgres}';"
    echo "$password" | sudo -S systemctl enable postgresql.service
    echo "$password" | sudo -S systemctl start postgresql.service
    echo "Postgres instalado correctamente."
  fi
  read -n 1 -s -r -p "PRESIONE [ENTER] para continuar..."
}

desinstall_postgres() {
  read -s -p "Ingresar contraseña de sudo: " password
  echo -e "\n"
  echo "$password" | sudo -S systemctl stop postgresql.service
  echo "$password" | sudo -S apt-get -y --purge remove postgresql\*
  echo "$password" | sudo -S rm -r /etc/postgresql
  echo "$password" | sudo -S rm -r /etc/postgresql-common
  echo "$password" | sudo -S rm -r /var/lib/postgresql
  echo "$password" | sudo -S userdel -r postgres
  echo "$password" | sudo -S groupdel postgresql
  echo "Posrgres desinstalado correctamente"
  read -n 1 -s -r -p "PRESIONE [ENTER] para continuar..."
}

make_backup() {
  read -s -p "Ingresar contraseña de sudo: " password
  echo "Listar las bases de datos..."
  sudo -u postgres psql -c "\l"
  read -p "Elegir la BD a respaldar: " dbName
  echo -e "\n"
  if [ -d "$1" ]; then
    echo "Estableciendo permisos en el directorio ..."
    echo "$password" | sudo -S chmod 755 $1
    echo "Realizando respaldo ..."
    sudo -u postgres pg_dump -Fc $dbName >"$1/dbName$fechaActual.bak"
    echo "Respaldo realizado Correctamente en la ubicacion: $1/dbName$fechaActual.bak"
  else
    echo -e "\nEl directorio $1 No Existe"
    echo -e "\n"
    read -n1 -p "Desea crear el directorio $1 (s/n)" res
    if [ $res = "s" ]; then
      sudo mkdir $1
      echo "$password" | sudo -S chmod 755 $1
      echo "Realizando respaldo..."
      sleep 3
      sudo -u postgres pg_dump -Fc $dbName >"$1/dbName$fechaActual.bak"
      echo "Respaldo realizado Correctamente en la ubicacion: $1/dbName$fechaActual.bak"
    else
      echo -e "\nSaliendo sin realizar Respaldo"
      sleep 3
    fi

  fi

  read -n 1 -s -r -p "Presione [ENTER] para continuar..."
}

restore_backup() {

  read -p "Ingresar el directorio donde se encuentran los respaldos   " dirBackup
  if [ -d $dirBackup ]; then

    echo "Listando los archivos de Respaldos..."
    sleep 3
    ls -la $dirBackup
    read -p "Ingresar el archivo .bak a restaurar:  " backup
    #echo -e "\n"
    if [ -f "$dirBackup/$backup" ]; then

      read -p "Ingresar nombre base de datos a restaurar:  " dbName
      verifyBdd= $(sudo -u postgres psql -lqt | cut -d \| -f 1 | grep -wq $dbName)
      if [ $? -eq 0 ]; then
        echo "Restaurando en la base de datos $dbName ..."
        sudo -u postgres pg_restore -Fc -d $dbName "$dirBackup/$backup"
        echo "Listar Bases de datos..."
        sudo -u postgres psql -c "\l"
      else
        echo "La base de datos a restaurar no se encuentra..."
        echo "Creando base de datos ..."
        sleep 4
        sudo -u postgres psql -c "CREATE DATABASE $dbName"
        sudo -u postgres pg_restore -Fc -d $dbName "$dirBackup/$backup"
        echo "Listar Bases de datos..."
        sudo -u postgres psql -c "\l"
      fi

    else
      echo "No se encuentra el archivo de Respaldo Ingresado"
      echo "Verifique nuevamente el nombre y vuelva a intentarlo"
    fi
  else
    echo "No se encuentra el directorio de Respaldos ingresado"
    echo "Verifique nuevamente el nombre y vuelva a intentarlo"
  fi

  read -n 1 -s -r -p "Presione [ENTER] para continuar..."
}

list_db() {
  echo -e "\Las Bases de Datos Actuales: "
  sudo -u postgres psql -c "\l"
  read -n 1 -s -r -p "Presione [ENTER] para continuar..."
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
  echo "5. Restar respaldo"
  echo "6. Salir"
  #Leerlos datos del usuario - capturar informacion
  read -p "ingrese una opcion [1 - 6]: " opciones
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
    list_db
    ;;
  6)
    echo -e "\nSaliendo del programa ......"
    exit 0
    ;;
  esac
done
