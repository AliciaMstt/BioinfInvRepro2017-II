# Unidad 7: Análisis de filogeniasy genética de poblaciones

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


#### Paquetes útiles por tema

**Ejercicio** explora los paquetes de Bioconductor y CRAN de acuerdo a tu tema y menciona tres que creas te serán útiles.

**Ejercicio** hagan equipos conforme a su tipo de datos y/o tema de investigación y discutan los paquetes que encontraron. Enlisten y describan para qué utilizarían los 3 que consideren más útiles.

Resultados del ejercicio anterior:


**Equipo Epigenética**

[ComplexHeatmap](https://bioconductor.org/packages/release/bioc/html/ComplexHeatmap.html): permite no solo graficar heatmaps sino también combinar un mapa de metilacion con uno de expresión y dar una correlación entre la metilacion y la expresión transcripcional.

[MethylMix](https://www.bioconductor.org/packages/release/bioc/html/MethylMix.html): Permite identificar patrones de metilacion en islas CpG que dirigen con cambios en el nivel de expresión.

[SMITE](https://bioconductor.org/packages/release/bioc/html/SMITE.html): (Significance-based Modules Integrating the Transcriptome and Epigenome): permite integrar información de transcriptoma y epigenoma directamente desde los resultados de NGS.

**Equipo Cáncer**

[MethylMix](https://www.bioconductor.org/packages/release/bioc/html/MethylMix.html): (ahora para) detectar Genes con alteraciones en su perfil de metilación, es importante porque el gen que trabajo (LM = Pygo2) es un reclutador de modificadores de histonas.

[pathifier](https://bioconductor.org/packages/release/bioc/html/pathifier.html): Busca vías de señalización alteradas que puedan iniciar el establecimiento del fenotipo tumoral. Para saber si componentes de la vía que estudio son importantes.

[Genomic Alignments](https://bioconductor.org/packages/release/bioc/html/GenomicAlignments.html) Se utilizaría para manipular pequeñas secuencias de aliniamiento de genes contra el genoma de referencia, para conteo de secuencias, contenido de nucleotidos dominios conservados en el genoma


**Equipo Transcriptómica**

[GOexpres](https://bioconductor.org/packages/release/bioc/html/GOexpress.html): que tiene métodos de agrupamiento para identificar ontología en genes y visualizar perfiles de expresión

[KEGGprofile](https://bioconductor.org/packages/release/bioc/html/KEGGprofile.html): permite mapear transcritos a la (famosa) enciclopedia online KEGG para conocer su ontología

[BitSeq](https://bioconductor.org/packages/release/bioc/html/BitSeq.html): sirve para identificar expresión diferencial de transcritos específicos mediante inferencia bayesiana 

[OmicCircos](https://bioconductor.org/packages/release/bioc/html/OmicCircos.html): sirve para hacer gráficas circulares de genes muy bonitas 


**Equipos genética de poblaciones y filogenómica**

[GCAT](https://bioconductor.org/packages/release/bioc/html/gcatest.html): Prueba de asociación en donde se controla la estructura poblacional, bajo una clase de rasgos.

[SimRAD](https://cran.r-project.org/web/packages/SimRAD/index.html): Predicción del número de loci RAD y GBS.

[SnpStats](https://bioconductor.org/packages/release/bioc/html/snpStats.html): Esencial para GWASTools, y estudio de asociación de SNPs-Fenotipo. Para obtener FST, LD, TDT, PCA, entre otros.

[Introgress](https://cran.r-project.org/web/packages/introgress/index.html): Sirve para estimar clinas genómicas en zonas de contacto entre especies en divergencia

[AsMap](https://cran.r-project.org/web/packages/ASMap/index.html): Para construir mapas de ligamiento

[hierfstat](https://cran.r-project.org/web/packages/hierfstat/index.html): Estadísticos básicos de genómica de poblaciones

[GENESIS](https://bioconductor.org/packages/release/bioc/html/GENESIS.html): Con este paquete podremos inferir si las poblaciones con las que trabajamos están estructuradas y realizar analisis de parentesco.


[ggtree](https://github.com/Bioconductor-mirror/ggtree/tree/release-3.3): Este paquete nos serviria para la lectura, edición y anotaciones de los arboles filogéneticos que pretendemos general a partir de datos genómicos (radseq, UCEs)

[BioGeoBEARS](https://cran.r-project.org/web/packages/BioGeoBEARS/index.html):
En este paquete podemos realizar reconstrucciones de geografía ancestral (biogeografía historica), modelar dispersion y extincion. Abordando así los objetivos finales de nuestros trabajos con base a filogenias genómicas.

[diversitree](https://cran.r-project.org/web/packages/diversitree/index.html)
En este paquete puede ayudarnos a probar si existen cambios en las tasas de diversificación y extinción. También puede ayudarnos a delimitar las especies nuevas que podamos proponer en nuestro grupo de estudio.

[PopGenome](https://cran.r-project.org/web/packages/PopGenome/index.html). Transformar los datos a diferentes formatos, calcula Fst, 
estimar desequilibrios de ligamiento.


[Muscle](https://www.bioconductor.org/packages/release/bioc/html/muscle.html)Con esta herramiento realizaremos el alinemamento de las secuencias obtenidos por Ion Torrent.



**Equipo Metabarcoding**

[MCMC.OTU](https://cran.r-project.org/web/packages/MCMC.OTU/index.html): Sirve para hacer análisis multivariado y asignar variables de manera individual (se puede usar ggplot para graficar)

[Metagenomesec](http://bioconductor.org/packages/release/bioc/html/metagenomeSeq.html): determina características e identifica abundancias entre grupos. 

[SpideR](http://spider.r-forge.r-project.org/SpiderWebSite/spider.html): sirve para delimitar especies de secuencias de barcoding.

[BiodiversityR](https://cran.r-project.org/web/packages/BiodiversityR/index.html): Sirve para hacer análisis estadísticos de comunidades ecológicas y  diversidad.


**Ejercicio**: 
1. Escoge uno de los paquetes que tu equipo eligió en el ejercicio pasado. 
2. Busca un tutorial, ayuda o vignette de ese paquete y síguelo con tus datos propios o con datos parecidos a los que tendrás que ya se encuentren publicados. 
3. Utiliza knitr para crear un "notebook" de lo que realizaste. 
4. Sube el código (.R) y el notebook (.html) a tu cuenta de github. Será necesario enviar el link via ClassMarker.

Puedes apoyarte con loas integrantes de tu equipo del ejercicio pasado pero los resultados se entregan de forma individual y deben ser diferentes datos de input. 

#### Ejemplo SNPRelate para análisis exploratorios genómica de poblaciones

Puedes revisar el Rmdown [aquí](../Practicas/Uni7/bin/Ejemplo_SNPRelate.Rmd).