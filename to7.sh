#!/bin/bash
source to7.conf

if [ -z "$1" ]; then
  echo -e "\nPor favor especifique la carpeta de origen como parametro \nUso: $0 <carpeta_proyecto_original> [commit]\n\n"
  exit 1
fi

if [ ! -d "$1" ] 
then
  echo "Error: Carpeta  de origen no existe."
  exit 1
fi

if [ ! -d "$1"7 ]
then
  git clone "$repositorio" "$1"7 
fi

echo "Copiando Archivos a $1"7
rsync -r --delete "$1"/ "$1"7/ --exclude .git --exclude vendor --exclude .idea

if [ ! -d "$1"7 ]
then
  echo "Error: Carpeta de destino no existe, hubo un problema!!."
  exit 1
fi


"$php" conv_fnames.php "$1"7
cd "$1"7

if [ "$2" = "install" ]; then
   composer install
fi

if [ "$2" = "commit" ]; then

   fecha=`date "+%d-%m-%Y %H:%M"`

   git add -A
   git commit -m "Generacion de Codigo $fecha"
   git push origin master
fi

if [ "$3" = "install" ]; then
   composer install
fi

if [ "$3" = "commit" ]; then

   fecha=`date "+%d-%m-%Y %H:%M"`

   git add -A
   git commit -m "Generacion de Codigo $fecha"
   git push origin master
fi

cd ..
