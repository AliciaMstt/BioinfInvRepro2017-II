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

**Equipo "en la lejanía"**
Nidia Mendoza Díaz
* *apex* en [CRAN](https://cran.r-project.org/web/packages/apex/index.html). Soporta como *input* formatos como FASTA o Clustal, que después transforma en diferentes objetos. Este paquete sería utilizado para visualizar la información filogenética proveniente de diferentes genes, con el fin de encontrar incongruencia entre ellos y explorar cómo manejar estos datos antes de realizar un análisis filogenético concatenado.
* *diversitree* en [CRAN](https://cran.r-project.org/web/packages/diversitree/index.html). Como *input* maneja archivos en formato .tree .nex .csv, es decir, archivos que contengan información para crear árboles filogenéticos o sean ya estos árboles. Sirve para estimar patrones de diversificación y evolución de caracteres sobre una filogenia que puede o no estar resuelta, ya que incorpora diferentes modelos y módulos para lidiar con ello (en una filogenia incompleta, se puede utilizar MuSSE y QuaSSE). Como también evalúa modelos de extinción y especiación, puede ser útil para reconstrucciones biogeográficas. Utilizaría este paquete para explorar hipótesis de diversificación dentro del género de Boraginaceae que trabajo que, además, presenta una distribución disyunta con grupos hermanos distribuidos principalmente en África.
* *ggtree* en [Bioconductor](https://www.bioconductor.org/packages/release/bioc/html/ggtree.html). Quizá éste suene a copia, pero considerando que hay muchos modelos de análisis de datos, los paquetes -que principalmente encontré en CRAN- redundan sobre las funciones de los paquetes anteriores. Con fines filogenéticos, es necesario tener una herramienta de manipulación de los árboles generados, por lo que concluyo escogiendo este paquete. Formatos soportados: newik, nexus, NHX, Jplace, Phylip, y los *output* de BEAST, EPA, HYPHY, PAML, PHYLDOG, pplacer, r8s, RAxML y RevBayes.
Los anteriores paquetes requieren tener activado el paquete *ape*.


# 7.5 Ejemplo estadísticos básicos genética de poblaciones

SNPStats, Hierfstat y plink

# 7.6 Ejemplo PCA, estructura poblacional

SNPRelate, admixture


# 7.7 Ejemplo filogenias con Phytools

[phytools: Phylogenetic Tools for Comparative Biology (and Other Things)](https://cran.r-project.org/web/packages/phytools/index.html) es un paquete de R desarrollado por [Lian Revell](http://faculty.umb.edu/liam.revell/) que consta de decenas de funciones para analizar y graficar árboles filogenéticos. El paquete cuenta con un excelente blog: [http://blog.phytools.org/](http://blog.phytools.org/), que vale la pena pasar las tardes leyendo.

Vamos a ver unos ejemplos de uso tomado de su blog en [estas notas](Prac_Uni7/bin/Ejemplo_phytools.Rmd).



