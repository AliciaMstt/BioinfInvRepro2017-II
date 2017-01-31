#! /bin/bash
## Bajar 3 secuencias de la misma proteina pero de diferentes organismos y contar aminoácidos
#Primero creo un directorio para descargar ahí las secuencias
mkdir Tarea3
#Hace un loop con los datos de las secuencias de las topoisomerasas que quiero bajar
for i in 554453236 896455390 558609125;do
#Ahora bajo todas las secuencias y las guardo en 3 diferentes archivos
curl -s "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=protein&rettype=fasta&id=$i" > Tarea3/topoiso$i.txt
done
#Para quitar la primera linea de todas las secuencias
sed -i -e "1d" Tarea3/topoiso*.txt
# quiero contar todos los caracteres de cada uno de los archivos
wc -m Tarea3/topoiso* > Tarea3/tar3.tx