#! /bin/bash

#Estas líneas son para contabilizar el número de TGCA por cada una de las secuencias descargadas y que al final lo mande a un archivo con el resultado de la contabilización

#decargo c/u de las secuencias y las guardo en los archivos con una redirección
curl -s "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nucleotide&rettype=fasta&id=57506625" > russ1.txt
curl -s "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nucleotide&rettype=fasta&id=57506624" > russ2.txt
curl -s "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nucleotide&rettype=fasta&id=188012432" > russ3.txt
curl -s "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nucleotide&rettype=fasta&id=188012431" > russ4.txt
curl -s "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nucleotide&rettype=fasta&id=188012430" > russ5.txt
#pido que cuente todos los TGCA de todos los archivos llamados russ y que lo pase a un archivo mostrándome los resultados
grep -c "TCGA" russ*.txt > cruss.txt