#! /bin/bash

# Este script crea 4 directorios y dentro de cada uno de ellos un archivo de texto

# Utilizar un loop
for i in PobA PobB PobC PobD; do
mkdir $i  # crear directorios
echo "Este es un individuo de la población $i" > $i/muestras.txt #crear texto y redireccionar a un archivo
done
 
