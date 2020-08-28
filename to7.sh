#!/bin/bash
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

echo "Copiando Archivos a $destino"
rsync -r --delete "$origen"/ "$destino"/ --exclude .git --exclude vendor --exclude .idea

if [ ! -d "$destino" ]
then
  echo "Error: Carpeta de destino no existe, hubo un problema!!."
  exit 1
fi


"$php" conv_fnames.php "$destino"

aqui = "$(pwd)"
cd "$destino"

if [ "$1" == "--install" || "$1" == "-i" || "$2" == "--install" || "$2" == "-i" ]; then
   "$php" "$composer" install 
   "$php" "$composer" dump-autoload
fi

if [  "$1" == "--commit" || "$1" == "-c" || "$2" == "--commit" || "$2" == "-c"  ]; then

   fecha=`date "+%d-%m-%Y %H:%M"`

   git add -A
   git commit -m "php 7.x compatible CCS code generated on $fecha"
   git push origin master
fi


cd "$aqui"
