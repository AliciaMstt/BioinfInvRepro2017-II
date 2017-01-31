#! /bin/bash

##descargar secuencias y crear un archivo fasta de cada una. Encontrar y contar en las secuencias TGCA 
for i in 721346758 577077146 577077145 577077145 979879990 979879989; do
curl -s "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nucleotide&rettype=fasta&id=$i" > Phaseolus$i.fasta 
grep -oE "TGCA" Phaseolus$i.fasta | wc -l
done
