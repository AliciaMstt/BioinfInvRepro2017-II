#! bin/bash

# Este script baja 5 secuencias de Juniperus y cuenta cuántas veces existe el sitio de restricción "TGCA"

# crear directorio para guardar secuencias e ir a el
mkdir Juniperus
cd Juniperus
# definir variable corta para curl
direcurl="http://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nucleotide&rettype=fasta&id="

# crear un archivo para para guardar resultados (y que sobreescriba los que existan previamente)
echo "Numero de ocurrencias de TGCA por secuencia" > ocurrTGCA.txt

## Hacer todo en un loop para más rápido
for i in 253994269 253994268 253994267 253994266 253994265; do
# bajar secuencia y escribirla a un archivo
curl $direcurl$i > loci_$i.fas #
# conseguir el nombre de la secuencia y escribirlo a un archivo
grep -oE ">\w+.*\| " loci_$i.fas >> ocurrTGCA.txt
# contar ocurrencias de TGCA y escribirlo bajo el nombre de la secuencia
grep -o TGCA loci_$i.fas | wc -l >> ocurrTGCA.txt
done

# volver a directorio inicial 
cd ..