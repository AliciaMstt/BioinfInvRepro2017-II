#! /bin/bash

## Este script baja 3 secuencias de nicleótidos de Craugastor de NCBI y cuenta la cantidad de aminoácidos en cada una de las secuencias

# Crear directorio para guardar datos e ir a el
mkdir question5
cd question5/

#Crear archivo donde se guardará el conteo de aminoácidos
echo "Numero de AA por secuencia" > numberAA.txt

# Bajar datos de NCBI y moverlos al directorio deseado
for i in AEV56518 ABR18665 ABR18663; do
curl -s "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=protein&rettype=fasta&id=$i" > Craugastor$i.fasta
#Copiar el nombre de cada secuencia y reescribirlo en el archivo de resultados
grep -oE ">\w+.*\| " Craugastor$i.fasta >> numberAA.txt
#Contar la cantidad de aminoácidos en cada secuencia y reescribirlo en el archivo de resultados
grep -v "^>" Craugastor$i.fasta | grep [a-zA-Z] -o | wc -l >> numberAA.txt
done