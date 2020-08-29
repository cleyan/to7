#!/bin/bash
if [ ! -e to7.conf ]; then
  echo -e "\nFalta el archivo de configuracion to7.conf\n\n"
  exit 1
fi

if [ "$1" = "--help" ] || [ "$1" = "-h" ] || [ "$2" = "--help" ] || [ "$2" = "-h" ] || [ "$3" = "--help" ] || [ "$3" = "-h" ]
then
   echo "Actualziador de Código generador por CodeCharge Studio 5.x para ser compatible con php 7.x"
   echo "./to7.sh [-i | --install] [-c | --commit] [-h | --help]"
   echo "-i --install  Ejecutar composer para instalar paquetes y dependiencias"
   echo "-c --commit   Hace Commit+Push al repositio del código generado "
   echo "-h --help     Ayuda del script" 
   exit 1 
fi

source to7.conf


if [ -z "$origen" ]; then
  echo -e "\nPor favor configure la carpeta de origen en el archivo to7.conf\n\n"
  exit 1
fi

if [ -z "$destino" ]; then
  echo -e "\nPor favor configure la carpeta de destino en el archivo to7.conf\n\n"
  exit 1
fi

if [ ! -d "$origen" ] 
then
  echo "Error: Carpeta  de origen no existe."
  exit 1
fi

if [ ! -d "$destino" ]
then
  git clone "$repositorio" "$destino" 
fi

echo "Copiando Archivos desde $origen a $destino"
rsync -r --delete "$origen"/ "$destino"/ --exclude .git --exclude vendor --exclude .idea

if [ ! -d "$destino" ]
then
  echo "Error: Carpeta de destino no existe, hubo un problema!!."
  exit 1
fi


"$php" conv_fnames.php "$destino"

aqui=$(pwd)

cd "$destino"

if [ "$1" = "--install" ] || [ "$1" = "-i" ] || [ "$2" = "--install" ] || [ "$2" = "-i" ] || [ "$3" = "--install" ] || [ "$3" = "-i" ]
then
   "$php" "$composer" install 
   "$php" "$composer" dump-autoload
fi

if [ "$1" = "--commit" ] || [ "$1" = "-c" ] || [ "$2" == "--commit" ] || [ "$2" = "-c" ] || [ "$3" == "--commit" ] || [ "$3" = "-c" ]
then
   fecha=`date "+%d-%m-%Y %H:%M"`

   git add -A
   git commit -m "php 7.x compatible CCS code generated on $fecha"
   git push origin master
fi


cd "$aqui"
