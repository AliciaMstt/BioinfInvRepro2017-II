# Unidad 7: Análisis de genética de poblaciones y filogenias

## 7.1. Bioconductor y paquetes bioinformáticos en R

Los paquetes son un grupo de funciones que alguien desarrolla en torno a un tema específico. CRAN alberga muchos paquetes de R, algunos de ellos útiles para bioinformática, como [adegenet](http://adegenet.r-forge.r-project.org/) y [ape](https://cran.r-project.org/web/packages/ape/ape.pdf). Puedes ver una lista de más paquetes relacionados con genética estadística en [CRAN Task Statistical Genetics](https://cran.r-project.org/web/views/Genetics.html).

Otra opción para encontrar paquetes útiles es googlear "R package" + keywords de tu tema de interés, por ejemplo "metabarcoding".

También existen repositorios de paquetes especializados en un área, por ejemplo bioinformática.

**Bioconductor** es un repositorio de paquetes de R especializaos en en análisis de datos genómicos y de secuenciación masiva. 

![logo_bioconductor.gif](logo_bioconductor.gif)

### Generalidades de Bioconductor

#### [Página principal de Bioconductor](https://www.bioconductor.org/)

#### [Paquetes de Bioconductor](https://www.bioconductor.org/packages/release/BiocViews.html#___Software)

Como los paquetes de Bioconductor están escritos en el lenguaje de R, muchos tendrán tipos de objetos particulares al paquete y funciones nuevas, pero con tener las bases de R que hemos visto estarás listoa para aprenderlo. 

La mejor manera de conocer qué hace y  usar un paquete es seguir un tutorial o vignette.

Por ejemplo esta de [ggtree](https://www.bioconductor.org/packages/release/bioc/vignettes/ggtree/inst/doc/ggtree.html)  y esta de [SNPRelate](http://corearray.sourceforge.net/tutorials/SNPRelate/).


#### [Workflows](https://www.bioconductor.org/help/workflows/)

Para algunas tareas comunes en análisis genéticos, como [Variant calling](https://www.bioconductor.org/help/course-materials/2014/BioC2014/Lawrence_Tutorial.pdf).


#### [Cursos y conferencias de Bioconductor](https://www.bioconductor.org/help/course-materials/)

En particular yo recomiendo el curso online [Bioconductor for Genomic Data Science](http://kasperdanielhansen.github.io/genbioconductor/) de Kasper D. Hansen que incluye videos y código con notas en R y html. 

#### Instalar Bioconductor y sus paquetes

1) Tener instalado R

2) Instalar bioconductor (`source` al script `biocLite.R` que nos permitirá instalar paquetes de Bioconductor).

```
source("https://bioconductor.org/biocLite.R")
biocLite()
```
(Si lo anterior manda algún error intenta http:// en vez de  https://)

3) Utilizar la función `biocLite` para instalar los paquetes deseados. Ejemplo:

```
biocLite("ggtree")
```

Nota: algunos paquetes necesitan pasos extra de instalación, como jalar algo de GitHub, pero esto será indicado en la documentación del paquete.

#### Cómo citar R y Bioconductor

Citar R:

```
citation("base")
```

Citar Bioconductor:

```
citation("Biobase")
```

Citar un paquete en particular:

```
citation("NombrePaquete")
```
(o lo que loas autoreas especifiquen en su sitio web)


## 7.2. Population Genomics with R - special issue of Molecular Ecology Resources 

Recientemente Molecular Ecology Resources publicó el special issue Population Genomics with R especialmente sobre population genomics with R. El cual incluye revisiones, paquetes nuevos y estudios de caso. 

Revisemos la [Tabla de Contenido](http://onlinelibrary.wiley.com/doi/10.1111/men.2017.17.issue-1/issuetoc).  

y la Introducción:

[Paradis E, Gosselin T, Grünwald NJ et al. (2017) Towards an integrated ecosystem of R packages for the analysis of population genetic data. Molecular Ecology Resources, 17, 1–4.](
http://onlinelibrary.wiley.com/doi/10.1111/1755-0998.12577/full)


## 7.3. Methods in population genomics list

Los análisis de genómica de poblaciones van mucho más allá de R, y hay muchos programas para hacer análisis muy específicos. 

[Yann Burgeouis](http://www.yannbourgeois.com/) sacó el fua y creo esta Lista de Métodos de genómica de poblaciones: [methodspopgen.com](http://methodspopgen.com/). Donde recopila métodos para inferir estructura, detectar selección e inferir la historia de la población. 

# 7.4. ¿Qué software de todo eso me sirve? 

#### Ejercicios  

**Ejercicio 1** explora los paquetes de Bioconductor, CRAN, el número especial de MER y methodspopgen.com de acuerdo a tu tema. Menciona tres que creas te serán útiles y explóralos con mayor profundidad.

**Ejercicio 2** hagan equipos conforme a su tipo de datos y/o tema de investigación y discutan los paquetes que encontraron. Enlisten y describan para qué utilizarían los 3 que consideren más útiles. Hagan un pull resquest (por equipo) para actualizar este .md del repositorio en la parte de abajo ("Resultados ejercicio software interesante por equipos").

**Ejercicio 3**: 

1. Escoge uno de los paquetes que tu equipo eligió en el ejercicio pasado. 
2. Busca un tutorial, ayuda o vignette de ese paquete y síguelo con tus datos propios o con datos parecidos a los que tendrás que ya se encuentren publicados. 
3. Si es un paquete de R o Bioconductor ytiliza knitr para crear un "notebook" de lo que realizaste. 
4. Sube el código (.R, .sh, etc) y si aplica el notebook (.pdf) a tu cuenta de github. Será necesario enviar el link via ClassMarker.

Puedes apoyarte con loas integrantes de tu equipo del ejercicio pasado pero los resultados se entregan de forma individual y deben ser diferentes datos de input. 

## Resultados ejercicio software interesante por equipos

Utilizar el siguiente formato para ponder sus resultados:

**Equipo tal**
Integrantes: Perengana, Fulana y Sutano
* Paquete 1 (con link). Explicación para qué lo ocuparían y qué input requiere. 
* Paquete 2. Idem
* Paquete 3. Idem

**RAD_team**
Integrantes: Carmina Martinez GOnzalez, Israel Moreno Contreras.
* Paquete 1: [**GENESIS**](https://www.bioconductor.org/packages/release/bioc/html/GENESIS.html). Análisis de estructura genética y relaciones de parentesco entre los individuos (ver si los individuos de mi muestra son primos, hermanos o qué relación tienen entre ellos). Para este programa se requiere que los archivos estén en formato PLINK o GDS.

* Paquete 2: [**poppr**](https://cran.r-project.org/web/packages/poppr/index.html). Medir diversidad genotípica y distancias genéticas de entre las poblaciones. Para este programa se requiere usar formato de GenAlEx en csv. 

* Paquete 3: [**genetics**](https://cran.r-project.org/web/packages/genetics/index.html). Saber si mis muestras se encuentran o no en equilibrio Hardy-Weinberg. Para este programa se requiere que los archivos estén en formato Pop, pedigree o market. 


**Equipo "en la lejanía"**
Nidia Mendoza Díaz
* *apex* en [CRAN](https://cran.r-project.org/web/packages/apex/index.html). Soporta como *input* formatos como FASTA o Clustal, que después transforma en diferentes objetos. Este paquete sería utilizado para visualizar la información filogenética proveniente de diferentes genes, con el fin de encontrar incongruencia entre ellos y explorar cómo manejar estos datos antes de realizar un análisis filogenético concatenado.
* *diversitree* en [CRAN](https://cran.r-project.org/web/packages/diversitree/index.html). Como *input* maneja archivos en formato .tree .nex .csv, es decir, archivos que contengan información para crear árboles filogenéticos o sean ya estos árboles. Sirve para estimar patrones de diversificación y evolución de caracteres sobre una filogenia que puede o no estar resuelta, ya que incorpora diferentes modelos y módulos para lidiar con ello (en una filogenia incompleta, se puede utilizar MuSSE y QuaSSE). Como también evalúa modelos de extinción y especiación, puede ser útil para reconstrucciones biogeográficas. Utilizaría este paquete para explorar hipótesis de diversificación dentro del género de Boraginaceae que trabajo que, además, presenta una distribución disyunta con grupos hermanos distribuidos principalmente en África.
* *ggtree* en [Bioconductor](https://www.bioconductor.org/packages/release/bioc/html/ggtree.html). Quizá éste suene a copia, pero considerando que hay muchos modelos de análisis de datos, los paquetes -que principalmente encontré en CRAN- redundan sobre las funciones de los paquetes anteriores. Con fines filogenéticos, es necesario tener una herramienta de manipulación de los árboles generados, por lo que concluyo escogiendo este paquete. Formatos soportados: newik, nexus, NHX, Jplace, Phylip, y los *output* de BEAST, EPA, HYPHY, PAML, PHYLDOG, pplacer, r8s, RAxML y RevBayes.
Los anteriores paquetes requieren tener activado el paquete *ape*.


**Phylo/Metabar**
Integrantes Nancy Bárcenas, Gerardo Torres, Víctor Taracena  y D. Jossue Jiménez 
* [phangorn](https://cran.r-project.org/web/packages/phangorn/index.html). La función phyDat sería útil para tranformar mis datos ("fasta") en uno admitido por phangorn ("phyDat").Se pueden realizar análisis filogenéticos de verosimilitud máxima y máxima pársimonia. Lo usaría tambien  para hacer comparación de diferentes modelos de sustitucion de aminoácidos. Tiene varias opciones para editar los árboles generados. Te permite exportar en formato "nexus". La usaríamos para generar el archivo que después será ingresado a otros análisis (filogenéticos, genética de poblaciones...). Requiere un formato del input "phyDat", si no se tiene, phangorn cuenta funciones para tranformar matrices y dataframe al formato "phyDat"
* [muscle](https://bioconductor.org/packages/release/bioc/html/muscle.html). Efectúa alineamientos múltiples de secuencias de DNA, RNA y aminoácidos mediante un algoritmo iterativo, en el cuál primero se calculan alineamientos pareados a los cuáles se asignan *scores*, con los cuáles se construye una matriz para la inferencia de árboles en los que se evalúa el mejor alineamiento. El input y el output son secuencias .fasta
* [phyloseq](https://www.bioconductor.org/packages/release/bioc/html/phyloseq.html). Sirve para cargar tablas de OTUs sin importar en qué software procesé
Los datos crudos para obtener la tabla (DADA2, UPARSE, QIIME, mothur, BIOM, PyroTagger, RDP, etc.)


**Equipo Filogenia y genética de poblaciones**
Integrantes: Brenda Muñoz, Raquel Hernández, Andrea Rebollo, Lisandro Hernández y Martín Cabrera

[**Decipher**](http://bioconductor.org/packages/release/bioc/html/DECIPHER.html). Es un paquete de Bioconductor, acepta *input* en formato FASTA y te permite realizar alineamiento y consenso de secuencias.

[**ggtree**](http://bioconductor.org/packages/release/bioc/manuals/ggtree/man/ggtree.pdf). También pertenece a Bioconductor. Permite realizar y editar árboles filogenéticos mediante distintos métodos y el *input* puede set .txt

[**Adegenet**](http://adegenet.r-forge.r-project.org/). Input: objeto "genind". Análisis básicos de genética de poblaciones: frecuencias alélicas (makefreq), heterocigosis esperada, observada (summary), , distancias genéticas de Nei (dist.genpop), análisis de discriminantes principales.

[**Pegas**](https://cran.r-project.org/web/packages/pegas/pegas.pdf). Input: objeto "loci", "haplotype", "haploNet". Evaluar equilibrio Hardy-Weinberg (hw-test), extraer frecuencias absolutas de haplotipos (haploFreq), hacer comparaciones entre haplotipos (diffHaplo), generar redes de haplotipos (haploNet).

**Equipo genoma de referencia/análisis filogenéticos**
Paqueterías de Bioconductor

**Integrantes**: Oscar Villafranco, Estefanía Cano, José Rubén Montes y Benjamín Cristian Corona Comunidad 

**Paquete 1**: [ggtree](http://onlinelibrary.wiley.com/doi/10.1111/2041-210X.12628/epdf) Se utilizaría para realizar anotaciones, modificaciones o editar nodos o ramas y/o para extraer información del árbol filogenético. **Input**: Formatos newick, nexus, NHX, phylip y jplace  **Output**: Árbol filogenético 

**EQUIPO COCHIS =@** MaryJo Contreras y Mariana Pérez Rivera

*Los paquetes que necesitaremos son:*

-- **Paquete 1. MSA** (Multiple Sequence Alignment )
 https://https://www.bioconductor.org/packages/release/bioc/html/msa.html

 
 La ventaja es que alinea con los algoritmos de ClustalW, ClustalOmega y Muscle en un solo paquete. Se usaría para el análisis de las secuencias obtenidas con base en la de referencia. No requiere paquetes adicionales. 

El input es en formato FASTA



--**Paquete 2. ggtree**
https://www.bioconducor.org/packages/release/bioc/html/ggtree.html


Para la edición de los árboles filogenéticos, manipulación de clados y darles formato más chulo

newick, nexus, NHX, phylip y jplace

**Paquete 2:** [Biostrings](https://www.bioconductor.org/packages/release/bioc/html/Biostrings.html) Se utilizaría para construir el alinemiento múltiple de los exones que hayan ensamblado a nuestra referencia. 
**Input**: fastq y fasta

**Paquete 3:** [Chromplot](https://www.bioconductor.org/packages/release/bioc/html/chromPlot.html). Se utilizará para ubicar y graficar regiones, genes de expresión y sintenia entre especies y en cromosomas. **Input**: Formato bed 


**Equipo delimitación de especies**

**Integrantes** Ofelia Jimenéz, Alejandro Manzanero, Marisol De la Mora y Myriam Campos  

* Bedassle
Cuantifica y distingue la contribución relativa de distancias geográficas y ecologicas, utilizando un algoritmo de cadenas de markov.   

`calculate.pairwise.Fst` Esta funcion se utiliza para calculas Fst pareadas entre un par de poblaciones o individuos. 

Input: Para poder correr este comando, se necesitan dos matrices: 

1) Matriz de alelos: `nrow = 2` cada renglon corresponde a cada una de las poblaciones o individuos y `ncol=` las columnas corresponden al numero de *loci*

2) Matríz del tamaño de la muestra: `nrow = 2` cada renglon corresponde a cada una de las poblaciones o individuos y `ncol=` las columnas corresponden al numero de *loci*. Cada celda corresponde al numero de cromosomas que fueron genotipificados en cada *locus* en cada población. 

Output: Calculo de la *Fst* entre las poblaciones, impreso en la pantalla de **R**. 

Link 
- [Bedassle v.1.5](https://www.rdocumentation.org/packages/BEDASSLE/versions/1.5) 

- [calculate.pairwise.Fst](https://www.rdocumentation.org/packages/BEDASSLE/versions/1.5/topics/calculate.pairwise.Fst)

* Phylodin

Implementa metodos Bayesianos y los acopla con modelos coalescentes para inferir cambios en el tamaño efectivo poblacional. 

Actualmente se emplea en el análisis de virus marcando la trayectoria de los clados marcando en donde hubieron eventos de alternancia y en donde coocurrerion.Sin embargo, uno de los objetivos de este paquete es implementarlo en el entendimiento de la historia evolutiva de otras especies, poder identificar los cambios en el tamaño efectivo poblacional en el tiempo

link: [(https://github.com/mdkarcher/phylodyn)]

* Paquete _adegenet_

[_adegenet_](http://adegenet.r-forge.r-project.org/) es un paquete de **R** que incluye diversas funciones para realizar análisis exploratorios de dato genéticos.

Uno de estos es el **Análisis Discriminante de Componentes Principales (DAPC)**, el cual se refiere a métodos para identificar y describir grupos genéticos (clusters).

Para lo anterior se pueden ocupar dos funciones: `find.clusters` y `dapc`. Se puede consultar un tutorial [aquí.](http://adegenet.r-forge.r-project.org/files/tutorial-dapc.pdf)

Función `find.clusters()`
El DAPC necesita que se definan grupos de manera previa, para lo cual utilizamos `find.clusters()`.

Esta función convierte los datos genéticos crudos en Componentes Principales mediante un PCA, y nos permite probar diferentes grupos (_k_) con una evaluaciónbayesiana de los mismos (Criterio de Información Bayesiano, BIC).

Acepta objetos tipo `data.frame`, `genind` y `genlight`.

El resultado de aplicar esta función es una lista, de la cual "nos quedamos" solamente con el elemento "grp", que son los clusters genéticos inferidos.

Función `dapc()`

Con esta función se describen los grupos genéticos previamente definidos, a partir de variables sintéticas (llamadas _funciones discriminantes_).

Al igual que `find.clusters`, acepta objetos de tipo tipo `data.frame`, `genind`y `genlight`.

Como resultado, se obtiene una gráfica de baras de los eigenvalores del análisis discriminante, donde el usuario define el número de funciones discriminantes (i.e. variables) que desea retener. El objeto resultante contiene toda la información del análisis, pero la manera de visualizar el resultado es mediante la función `scatterplot()`.

* Paquete GENESIS

Lo usariamos para estimar la estructura poblacional. Este provee un modelo para la estimacion de los coeficientes de ancestria, probabilida de compartir IBD y coeficientes de endogamia usando datos genome-wide SNP. 

 link
[GENESIS.pdf](https://www.bioconductor.org/packages/release/bioc/manuals/GENESIS/man/GENESIS.pdf)

Presenta dos funciones: 

1)`PC-AiR`para la detencion de estructura poblacional en una muestra que puede contener relaciones parentesco cripticas.

2)`PC-Relate`   usa los componentes princiaples representativos de la ancestria para ajustar la estructura de la poblacion y precisar las estimaciones de relaciones geneticas recientes como coeficientes de parentesco, IBD y coeficientes de endogamia.

Input 
Archivos PLINK o GDS.

Output 
Un data.frame con varias columnas mostrando el resultado. 

**Equipo: Genomica de poblaciones**

Gissella Pineda

[**FastSTRUCTURE**](http://rajanil.github.io/fastStructure/) análisis con máxima verosimilitud que permite realizar agrupamiento genético de individuos; es mucho más rapido que *Structure* lo que podría ser conveniente para grandes cantidades de datos como SNPs. **Input**: formato str ó  bed.

[**SPRelate**](https://bioconductor.org/packages/release/bioc/html/SNPRelate.html) permite realizar análisis de componentes principales y análisis de parentezco con datos de SNPs; en caso de no tener estructura popblacional, sería util evaluar las relaciones de parentezco dentro los individuos de mi población. **Input**: formato VCF

[**GENELAND**](https://cran.r-project.org/web/packages/Geneland/)  Detecta estructura poblacional basada en la frecuencia de los alelos asociada a Hardy-Weinberg y desequilibrio de ligamiento. Los modelos los realiza en base a información genética y geográfica para inferir la organización espacial de los individuos; aunque los datos geograficos son opcionales. **Input**:no requiere un formato especializado, puede ser un archivo csv o txt, sólo se debe de tener en cuenta el orden de las columnas; tanto para los datos genéticos como para los geográficos.

**Equipo Campechano**
Integrantes: Nelly, Tania, Sebastian y Madisson
* GENESIS [link](https://www.bioconductor.org/packages/release/bioc/html/GENESIS.html) Programa para estimar y contabilizar estructura poblacional, pedigree, coeficientes de parentezco, endogamia --> Es util para hacer PCA y detectar estructura poblacional *Input:* PLINK .bed, .bim, y .fam
* genfilter [link](https://www.bioconductor.org/packages/release/bioc/html/genefilter.html) Programa con métodos de filtrado genes obtenidos de NGS --> Es util para detectar si hay genes cerca de algún gen de interés detectado (para hacer perfiles de expresión,descartar genes ligados), o hacer ANOVA. *Input:* matriz de microarreglos o datos de RNAseq.
* funciSNP [link](https://www.bioconductor.org/packages/release/bioc/html/FunciSNP.html) Programa que integra información de estudios de asociación genómica (GWAS) para identificar SNP candidatos funcionales en regiones codificantes y no codificantes --> Es util para relacionar SNPś candidatos con caractres fisiológicos y funcionales *Input:* .bed


# 7.5 Ejemplo estadísticos básicos genética de poblaciones

## PLINK 

[PLINK](https://www.cog-genomics.org/plink/1.9/) es un software de acceso libre muy usado porque permite realizar un amplio rango de análisis genómicos de forma relativamente rápida y sencilla.

Dentro de los análisis que pueden hacerse usando PLINK, están:

- Manejo y transformación de datos
- Estimación de desequilibrio de ligamiento
- Matriz de identidad por descendecia (IBD) e identidad por estado (IBS)
- Asociación genómica

**Limitaciones:**
- Análisis de variantes estructurales (excepto indels pequeños)
- Análisis de datos crudos
- No interfaz gráfica

Los dos formatos principales de PLINK son **ped** y **bed**, pero acepta formatos comúnmente usados con **vcf**.


**Ejercicio:** Descarga e instala [PLINK](https://www.cog-genomics.org/plink/1.9/). Echa un ojo a las funciones que puedes usar.

Para conocer si cada uno de los loci del set de datos ``cocci_silv`` se encuentra en equilibrio HW, usaríamos este comando:

``
plink --file ../data/cocci_silv --hardy --out ../out/HW_cocci
``

Con el siguiente comando quitaré los loci que son indels y le pediré que el archivo resultante se encuentre en formato vcf.

``
plink --file ../data/cocci_silv --snps-only just-acgt -recode vcf --out
``

**Ejercicio:** Estima el desequilibro de ligamiento en términos de r<sup>2</sup>. Posteriormente, quédate con aquellos SNPs cuya r<sup>2</sup> < 0.2. El archo resultante debe llamarse `/data/cocci_silv_filt.bed`


## Hierfstat
Este paquete de R te permite estimar estadísticos F con datos de genomas haploides y diploides, tomando en cuenta por la estructura de las poblaciones. Las notas de la clase están [aquí](Prac_Uni7/bin/Hierfstat_cocci.html).


## SNPstats
Es un paquete de R muy utilizado. Dentro de las estimaciones que pueden obtenerse se encuentran:

- Fst
- LD
- Imputación
- Filtro de SNPs


# 7.6 PCA y estructura poblacional

## SNPRelate

[SNPRelate](https://bioconductor.org/packages/release/bioc/html/SNPRelate.html) es un paquete de Bioconductor muy bueno y rápido para hacer PCA, asociación genómica, análisis de parentesco y exploraciones básicas de datos genómicos. Puedes ver sus tutoriales [aquí](https://bioconductor.org/packages/release/bioc/vignettes/SNPRelate/inst/doc/SNPRelateTutorial.html), y seguiremos [estas notas en clase](Prac_Uni7/bin/Ejemplo_SNPRelate.html).

## Admixture
Herramienta que permite estimar la ancestría de individuos a partir de un set de datos de SNPs. Usa el mismo modelo estadístico que Structure pero es más rápido.

[Aquí](https://www.genetics.ucla.edu/software/admixture/index.html) puedes encontrar el ejecutable y el manual.

**Ejercicio:** Descarga el ejecutable y el manual de Admixture. ¿Qué tipo de archivo es el input de Admixture?
Corre Admixture con el set de datos de cocci_silv. 

``
for K in 1 2 3 4 5; \
do ./admixture --cv ../data/cocci_silv.bed $K | tee ../data/admixture/log${K}.out;
done
``
Para guardar los resultados de versosimilitud en un archivo:

``
grep -h CV ../data/admixture/log*.out > ../data/admixture/coccineus_Kerror.txt
``

Grafica en R el resultado. ¿Qué valor de K elegirías para este set de datos?

```
library(ggplot2)

###Estimación de error con distintas k
k.error<- read.delim("../data/admix_results/coccineus_Kerror.txt", header = F, sep = ":")
rownames(k.error)<- c("k=1", "k=2", "k=3", "k=4", "k=5")

#plot error de K
e.plot<- ggplot(data=k.error, aes(x=1:7, y=V2)) + geom_point() + geom_line()
e.plot + xlab("k") + ylab("Error")

###Datos Poblaciones
meta<- read.delim("../meta/cocci_wild_meta.csv", sep = ",")
pop<- meta$Poblacion

###Datos admixture
admix.4<- read.delim("../bin/cocci_silv.4.Q", sep = " ", header = F)
cocci.admix.4 <- cbind(pop, admix.4) #Unir datos admixture con poblacion

##### PLOTS #####
mis.col <- palette(c("#edad2f", "#774ddd", "#bc0021", "#2cb25d"))

##Plot admixture K=4
barplot(t(as.matrix(cocci.admix.4[,2:5])), col= mis.col, names.arg = cocci.admix.4$pop, las=2, cex.names = .5,
       ylab="Ancestría", border=NA, cex.axis = 1.5, axisnames = T)
       
```

# 7.7 Ejemplo filogenias con Phytools

[phytools: Phylogenetic Tools for Comparative Biology (and Other Things)](https://cran.r-project.org/web/packages/phytools/index.html) es un paquete de R desarrollado por [Lian Revell](http://faculty.umb.edu/liam.revell/) que consta de decenas de funciones para analizar y graficar árboles filogenéticos. El paquete cuenta con un excelente blog: [http://blog.phytools.org/](http://blog.phytools.org/), que vale la pena pasar las tardes leyendo.

Vamos a ver unos ejemplos de uso tomado de su blog en [estas notas](Prac_Uni7/bin/Ejemplo_phytools.html).



Puedes revisar el Rmdown [aquí](../Practicas/Uni7/bin/Ejemplo_SNPRelate.Rmd).

