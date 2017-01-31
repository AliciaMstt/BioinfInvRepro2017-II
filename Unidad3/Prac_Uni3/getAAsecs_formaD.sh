#! /bin/bash

### Este script descarga tres secuencias de proteínas de tres especies de NCBI y cuenta los aminoácidos de cada una

# Crear directorio para guardar datos e ingresar a él
mkdir Proteina
cd Proteina

# Descargar secuencias de NCBI
curl -s "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=protein&rettype=fasta&id=94451576" > Frijol.fasta
curl -s "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=protein&rettype=fasta&id=710596" > Soya.fasta
curl -s "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=protein&rettype=fasta&id=485953" > Arroz.fasta

# Crear un archivo para guardar resultados
echo "Número de aminoácidos de cada secuencia" > NumAA.txt

## Contar cuántos aminoácidos tiene cada secuencia descargada
for i in Arroz Frijol Soya; do
# Escribir el nombre común del organismo en archivo de resultados
echo "$i tiene " >> NumAA.txt
# Contar aa de cada secuencia y escribirlo bajo el nombre del organismo
grep -E "^[A-Z]" $i.fasta | wc -m >> NumAA.txt
done