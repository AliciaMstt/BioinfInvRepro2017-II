#! /bin/bash

#Descargar del NCBI 3 secuencias de la misma proteinas de 3 especies diferentes y crear un archivo fasta de cada una. Contar cuantos aminoacidos tiene cada una de las secuencias.
for i in 327492254 324983617 324983635; do
curl -s "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=protein&rettype=fasta&id=$i" > AminoacidoAnastrepha$i.fasta
#Grep para buscar aa y contarlos
grep -oh "[A-Z]" AminoacidoAnastrepha$i.fasta | wc -l
done