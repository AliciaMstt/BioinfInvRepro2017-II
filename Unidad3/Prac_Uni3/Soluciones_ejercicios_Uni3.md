# Soluciones a ejercicios Uni3

## Ejercicos de clase

**1. Escribe **una** línea de código que cree un archivo con los nombres de las muestras de maiz enlistadas en** `Practicas/Uni2/Maiz/nuevos_final.fam` 

Solución: 

```
$ grep -oE "maiz_[0-9]{1,3}" nuevos_final.fam > muestras.txt
$ head muestras.txt 
maiz_3
maiz_68
maiz_91
maiz_39
maiz_12
maiz_41
maiz_35
maiz_58
maiz_51
maiz_82
```

Alternativa:

`grep -oE "maiz_\w+" nuevos_final.fam > muestras.txt`


**2. Escribe un script que cree 4 directorios llamados PobA, PobB, PobC, PobD y dentro de cada uno de ellos un archivo de texto que diga "Este es un individuo de la población x" donde x debe corresponder al nombre del directorio.** 

Solución: 

En un editor de texto escribir el contenido y guardarlo, en este ejemplo se llama `ejercicio2.sh` (lo puedes ver también en [ejercicio2.sh](ejercicio2.sh))


```
#! /bin/bash

# Este script crea 4 directorios y dentro de cada uno de ellos un archivo de texto

# Utilizar un loop
for i in PobA PobB PobC PobD; do
mkdir $i  # crear directorios
cd $i
echo "Este es un individuo de la población $i" > muestras.txt #crear texto y redireccionar a un archivo
cd ..
done
 
```

Luego volverlo ejecutable y correrlo:

```
$ chmod u+x ejercicio2.sh 
$ ./ejercicio2.sh 
$ ls
Chiropt			PobB			archivoderelleno.txt
Ejstacks		PobC			ejercicio2.sh
PobA			PobD
$ cat PobA/muestras.txt 
Este es un individuo de la población PobA
```


**3. Escribe un script que baje 5 secuencias (algún loci corto, no un genoma) de una especie que te interese y señala cuántas veces existe la secuencia "CCTGCAGG" en cada una de ellas. ¿Sabes qué hace esta secuencia?**

Solución: 

En un archivo poner el contenido siguiente y guardarlo, en este ejemplo se llama [`ejercicio3_formaAlicia.sh`](ejercicio3_formaAlicia.sh):

```
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

```

Luego repetir el procedimiento del ejercico anterior para correrlo.

Hay muchas formas de resolver el ejercico 3. Puedes checar otras soluciones a las que llegaron tus compañeros en [ejercicio3_formaB.sh](ejercicio3_formaB.sh) y [ejercicio3_formaC.sh](ejercicio3_formaC.sh).


**4. Imagina que tienes datos de RADseq de una serie de poblaciones de una especie a lo largo de la Sierra Madre Occidental colectados a altas y bajas altitudes. Ya has filtrado las secuencias sucias, demultiplexeado y corrido un ensamblaje *de novo* utilizando el programa [Stacks](http://catchenlab.life.illinois.edu/stacks/).** 

**En [Practicas/Uni3/Ejstacks](../Practicas/Uni3/Ejstacks) encontrarás varios directorios como los que hubieras generado hasta este momento si dichos datos fueran reales. Por ejemplo, en el directorio `/raw` estarían tus secuencias crudas y en el directorio `/stacks` el output del ensamblado de Stacks y tu Population Map [busca qué es aquí](http://catchenlab.life.illinois.edu/stacks/comp/populations.php).** 

**a) Desde la Terminal explora el archivo `Ejstacks/stacks/PopMapAll.txt`.**  

**Notarás un patrón muy simple en cómo están llamadas tus muestras:**

* **Los primeros tres caracteres corresponden a un estado de la república**
* **Los segundos tres caracteres corresponen a la categoría altitudinal de la muestra**
* **Los números del final se refieren al número de muestra para ese estado y altitud.** 

**Tras un análisis del resultado que obtuviste de estos datos tu y una colaboradora deciden correr un programa que requiere los datos en formato [plink](http://pngu.mgh.harvard.edu/~purcell/plink/), por lo que tuviste que utilizar el módulo [*populations* de Stacks](http://catchenlab.life.illinois.edu/stacks/comp/populations.php) para exportar tus datos al formato adecuado.** 

**Esto lo lograste incluyendo en un script una líndea de comando como la de abajo (pero sustituyendo lo que está entre `[]` por el path adecuado:**

`populations -P [pathdirectorioDatosStacks] -M [../stacks/PopMapAll.txt] -b 1 -f p_value --plink --write_single_snp`

**Después de analizar estos datos tu colaboradora observa que tienes muchos datos faltantes (missing data), lo cual interfiere con el análisis, por lo que te escribe lo siguiente:**

"*Seems like in order to get all the populations (State+Altitude) included, 7 individuals is the highest we can go. I'd recommend filtering out all SNPs that are in less than 7 individuals per population, and then selecting SNPs again to export to plink format as you did before. It might be worth going back in the future and doing this again at different levels of individuals; so could you please send me the data ran independently for each population for everything from min 7 to 10 individuals?*"

**Tras consultar el manual de [*populations* de Stacks](http://catchenlab.life.illinois.edu/stacks/comp/populations.php) notas que hay una opción (`-r`) para filtrar los loci acorde a que existan en un mínimo de individuos de una población, pero que está en términos de porcentaje y no de número de individuos.** 

`
r — minimum percentage of individuals in a population required to process a locus for that population.
`

**b) Haz un script que te permitiría correr el programa _populations_ de Stacks independientemente para cada población y para cada mínimo de individuos que te pidió tu colaboradora, considerando lo siguiente**:

 
*  **Tu script debe determinar automáticamente el valor que darle a `-r` con base en el número total de individuos por cada población (ej: 5 individuos de 10 que hay en la población= 5/10).** 

* **Como no tienes instalado el programa Stacks (ni datos) la línea de tu script donde correrías *populations* debe hacer un `echo` de cómo debiera verse la línea para correr *populations*. Otros comando, por ejemplo crear directorios, sí deben funcionar.** 

* **El output de *populations* serían dos archivos llamados plink.ped y plink.map. Como no lo estamos corriendo de verdad, el ejercico es que el `echo` del punto anterior sea escrito a un archivo de texto llamado `falsoplink.out` y que dicho archivo quede dentro un directorio por población y filtro mínimo de individuos**. 

Solución: 

La solución a este ejercicose encuentra en [/Ejstacks/bin/ejercicio4.sh](./Ejstacks/bin/ejercicio4.sh) ya que bin es el directorio donde normalmente los scripts se guardan cuando el análisis involucra muchos datos subdivididos en directorios. 

Este es el contenido del script (pero si lo ves en el link el formato es mejor):


```
#! /bin/bash

#### Crear un PopulationMap para cada población (Estado+Altitud)

for i in Dgo Sin Son Chi Zac; do
## Crear parametros para grep
# esto es necesario para poder poner una variable dentro de un grep y que no se confunda con el $
# para busqueda en archivo 
grep_paramsAlt="${i}Alt.*" 
grep_paramsBaj="${i}Baj.*"
# para nombre de PopMap
grepPopMapAlt="${i}Alt.txt"
grepPopMapBaj="${i}Baj.txt"

## Usar grep para generar un pop map por cada pop
grep -oE $grep_paramsAlt ../stacks/PopMapAll.txt > ../stacks/PopMap$grepPopMapAlt
grep -oE $grep_paramsBaj ../stacks/PopMapAll.txt > ../stacks/PopMap$grepPopMapBaj
done

#### Correr populations de Stacks para los diferentes mínimos de individuos por cada población
for j in 7 8 9 10; do 
for x in DgoAlt SinAlt SonAlt ChiAlt ZacAlt DgoBaj SinBaj SonBaj ChiBaj ZacBaj; do

# Crear directorios para guardar datos
mkdir -p ../output.data/$x/$j

# calcular qué porcentaje de la población son el min de individuos deseados (populations lo ocupa en -r)
tot=`wc -l < ../stacks/PopMap$x.txt` # el texto se pone entre ` ` para indicar que es un comando que queremos asignar a una variable ("" no funcionarían)
pinds=`echo $j/$tot | bc -l` #bc es la calculadora para decimales en bash

# Correr populations Stacks para exportar a formato plink (como ejercicio solo correr un echo y guardarlo en el lugar que irían los resultados)
echo "populations -P ../stacks -M ../stacks/PopMap$x.txt -r $pinds -b 1 -f p_value --plink --write_single_snp" > ../output.data/$x/$j/falsoplink.out
done
done
```

Para correrlo debes seguir los pasos subsecuentes del ejercicio 2.


## Ejercicios de la tarea

**Escribe un script que baje 3 secuencias de NCBI de la misma (o putativamente la misma) proteína de 3 especies diferentes y que cuente cuántos aminoácidos tiene cada una de las secuencias**

Este ejercicio lo resolvieron de maneras muy distintas. Aquí una recopilación de las mejores respuestas que agrupan las difernetes formas de hacerlo:

[getAAsecs_formaA.sh](getAAsecs_formaA.sh)

[getAAsecs_formaB.sh](getAAsecs_formaB.sh)

[getAAsecs_formaC.sh](getAAsecs_formaC.sh)

[getAAsecs_formaD.sh](getAAsecs_formaD.sh)


Resumen de cómo hicieron el grep y el conteo:

`grep -oh "[A-Z]" AminoacidoAnastrepha$i.fasta | wc -l`

`grep -v "^>" Craugastor$i.fasta | grep [a-zA-Z] -o | wc -l`

```
sed -i -e "1d" Tarea3/topoiso*.txt
wc -m Tarea3/topoiso* > Tarea3/tar3.tx
```

`grep -E "^[A-Z]" $i.fasta | wc -m >> NumAA.txt`




 
**Si tu script del ejercicio anterior se llamara getAAsecs.sh cómo lo ejecutarías desde la terminal asumiendo que no lo has vuelto ejecutable?**

`bash getAAsecs.sh`

**¿Cómo volverías ejecutable el script del ejercicio anterior?**

`chmod u+x getAAsecs.sh`


