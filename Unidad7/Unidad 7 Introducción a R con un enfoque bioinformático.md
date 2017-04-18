# Unidad 7 Introducción a R con un enfoque bioinformático

## 7.1. R y RStudio 		

### ¿Qué es R?
* R es un lenguaje de programación y un ambiente de cómputo estadístico
* R es software libre (no dice qué puedes o no hacer con el software), de código abierto (todo el código de R se puede inspeccionar - y se inspecciona).
* Cuando instalamos R, instala la base de R. Mucha de la funcionalidad adicional está en **paquetes** que la comunidad crea.

### ¿Por qué R?
* R funciona en casi todas las plataformas (Mac, Windows, Linux e incluso en Playstation 3).
* R es un lenguaje de programación completo, permite desarrollo de DSLs (funciones muy específicas)
* R promueve la investigación reproducible: no sólo de análisis sino de cómo se hicieron las figuras.
* R está actualizado gracias a que tiene una activa comunidad. Solo en CRAN hay cerca de 8000 paquetes (funcionalidad adicional de R creadas creada por la 
comunidad).
* R se puede combinar con herramientas bioinformáticas y formatos de datos procesados (e.g. plink, vcf, etc) para realizar análisis y figuras.
* R tiene capacidades gráficas muy sofisticadas.
* R es popular como herramienta estadística ([la guerra del software](http://datacamp.wpengine.com/wp-content/uploads/2014/05/infograph.png)) y cada vez más también como herramienta bioinformática ()



### Descargar R y RStudio
Para comenzar se debe descargar [R](https://cran.r-project.org), esta descarga incluye R básico y un editor de textos para escribir código. Después de descargar R se recomienda descargar [RStudio](https://www.rstudio.com/products/rstudio/download/) (gratis y libre).

**RStudio** es un ambiente de desarrollo integrado para R: incluye una consola, un editor de texto y un conjunto de herramientas para administrar el espacio de trabajo cuando se  utiliza R. 




### ¿Cómo entender R?
* Hay una sesión de R corriendo. La consola de R es la interfaz entre R y nosotros. 
* En la sesión hay objetos. Todo en R es un objeto: vectores, tablas,  funciones, etc.
* Operamos aplicando funciones a los objetos y creando nuevos objetos.

##### La consola
Es una ventana que nos permite comunicarnos al motor de R. Esta ventana acepta **comandos** en el lenguaje de R y brinda una respuesta (resultado) a dichos comandos. 

Por ejemplo, le podemos pedir a R que sume 1+1 así:

```
1+1
```    

La consola se distingue por tener el símbolo `>` seguido de un cursor parpadeante que espera a que le demos instrucciones (cuando recién abrimos R además muestra la versión que tenemos instalada y otra info).

Tu Consola debe verse más o menos así después del ejemplo anterior:

![Consola](Consola.PNG)


##### Scripts y el editor

Como hemos visto en otras unidades, un **script** es un archivo de nuestros análisis que es:

* un archivo de texto plano 
* permanente,
* repetible,
* anotado y
* compartible 


En otras palabras, un script es una recopilación por escrito de las instrucciones que queremos enviar a la consola, de modo que al tener esas instrucciones cualquiera pueda repetir el análisis tal cual se hizo. 

Un script muy sencillo podría verse así:

![Script](Script.PNG)

"Ejemplo_script.R" es el nombre del archivo, es decir, que este texto es un **archivo de texto** (con terminación .R en vez de .txt) que vive en mi computadora.

![dondeEjemplo_script](dondeEjemplo_script.PNG)

RStudio brinda además de la consola un editor de texto, que es la pantalla que se observa en el ejemplo anterior. Lo que escribas en el editor de texto puede "enviarse" a la consola con los shortcuts de abajo o con el ícono correr. 

La idea es que en el editor de texto vayas escribiendo los comandos y comentarios de tu **script** hasta que haga exactamente lo que quieras. 


### Algunos _shortcuts_ útiles en RStudio son:

**En el editor**  

* command/ctrl + enter: enviar código a la consola  
* ctrl + 2: mover el cursor a la consola

**En la consola**  

* flecha hacia arriba: recuperar comandos pasados  
* ctrl + flecha hacia arriba: búsqueda en los comandos  
* ctrl + 1: mover el cursor al editor  
* ? + nombre de función: ayuda sobre esa función.


## 7.2. Funciones básicas de R más importantes para bioinformática 

### Introducción a R como lenguaje de programación

Antes de pasar a las funciones bionformáticas, veamos la sintaxis básica de R y los principales comandos que aprender.  

Un excelente tutorial para familiarizarse con los comandos de R es [TryR](http://tryr.codeschool.com/).

* Expresiones matemáticas: `1+1`
* Strings de texto: `"¡Holaaaaa mundo!"`
* Valores lógicos: `1<5`, `2+2 ==5`
* Crear una variable: `x<-5`

* Funciones: son un comando que hace algo específico dentro de R. Ejemplo: `sum()`, `mean()`, `help()`

**Ejercicio**: crea una variable con el logaritmo base 10 de 50 y súmalo a otra variable cuyo valor sea igual a 5.

Vectores:
* vectores `c(5, 4, 6, 7)`, `5:9`
* Acceso a elementos de un vector `[]` 

**Ejercicio:** suma el número 2 a todos los números entre 1 y 150. 

**Ejercicio** ¿cuántos números son mayores a 20 
en el vector -13432:234?

Matrices
* Matrices `matrix(0, 3, 5)`
* Acceso a elementos e una matriz `[ , ]`

Data frames
* Data frame `data.frame(x = c("a", "b", "c"), y = 1:3)`
* Acceso a elementos e una data.frame `[ , ]`, `$`

Para una versión un poco más amplia del anterior resumen veamos estas [notas sobre los tipos de objetos de R básico](Tipos_objetos_baseR.Rmd)

* Funciones de sistema: `list.files`, `getwd`, `setwd`
* Cargar una función: `source`
* Instalar paquetes (sola una vez en cada equipo): `install.packages`.
* Cargar un paquete previamente instalado (cada vez que corramos el script): `library`.
* Cargar a R un archivo de texto con filas y columnas (separado por tabs o comas): `read.delim`.
* "Pegar" texto uno detrás de otro: `paste()` y `paste0()`.

**Ejercicio:** Carga en R el archivo `Practicas/Uni7/meta/maizteocintle_SNP50k_meta_extended.txt` y utiliza un script de R, que debe estar guardado en `Practicas/Uni7/bin`, para responder lo siguiente:

* ¿Qué tipo de objeto creamos al cargar la base?

* ¿Cómo se ven las primeras 6 líneas del archivo?

* ¿Cuántas muestras hay?

* ¿De cuántos estados se tienen muestras?

* ¿Cuántas muestras fueron colectadas antes de 1980?

* ¿Cuántas muestras hay de cada raza?

* En promedio ¿a qué altitud fueron colectadas las muestras?

* ¿Y a qué altitud máxima y mínima fueron colectadas?

* Crea una nueva df de datos sólo con las muestras de la raza Olotillo

* Crea una nueva df de datos sólo con las muestras de la raza Reventador, Jala y Ancho

* Escribe la matriz anterior a un archivo llamado "submat.cvs" en /meta.

### For loops

Al igual que en bash, en R pueden hacerse for loops, con la siguiente sintaxis:

`for (counter in vector) {commands}`

Ejemplo:

```{r}
for (i in 2:10){
  print(paste(i, "elefantes se columpiaban sobre la tela de una araña"))
}

```

La anterior es la versión más simple de un loop. Para otras opciones (como `while`, `if`, `if else`, `next`) revisa este [tutorial](https://www.datacamp.com/community/tutorials/tutorial-on-loops-in-r).


**Ejercicio** 

* Escribe un for loop para que divida 35 entre 1:10 e imprima el resultado en la consola.

* Modifica el loop anterior para que haga las divisiones solo para los números nones (con un comando, NO con `c(1,3,...)`). Pista: `next`.

* Modifica el loop anterior para que los resultados de correr todo el loop se guarden en una df de dos columnas, la primera debe tener el texto "resultado para x" (donde x es cada uno de los elementos del loop) y la segunda el resultado correspondiente a cada elemento del loop. Pista: el primer paso es crear un vector *fuera* del loop. Ejemplo:

```{r}
elefantes<-character(0)
for (i in 2:10){
  elefantes<-rbind(elefantes, (paste(i, "elefantes se columpiaban sobre la tela de una araña")))
}
elefantes

```

**Ejercicio**  

Observa el siguiente código:

(para correr esto es necesario estar conectado a la red UNAM o tener una api key)

```{r}
# Required packages
library(rscopus)
library(httr)

# Definir Apikey para poder acceder a scopus (la generé desde http://dev.elsevier.com/myapikey.html, se requiere entrar desde bidiunam)
api_key<-"b3d334ef41f4096efa745ee88fcc55ca"


# read indicadores list
indicador<-read.delim("../data/indicadores.txt", header=FALSE, 
                       quote="", stringsAsFactors=FALSE)

## RUN

# build query
pais<-"Mexico"
query_string<-paste0('(TITLE-ABS-KEY(Maize)', ' AND TITLE-ABS-KEY(', pais, ') AND TITLE-ABS-KEY(', indicador[1,1],'))')

# run query
# check out this for more filters than can be added to the query: http://api.elsevier.com/documentation/SCOPUSSearchAPI.wadl

s = generic_elsevier_api(query = query_string,
  type = "search", search_type = "scopus",
  api_key = api_key)

# extract number of resulted documents 
res<-s$content$`search-results`$`opensearch:totalResults`
      
```


Con base en el código anterior, utiliza un loop para repetir la búsqueda para todos los indicadores del archivo `/data/indicadores.txt` (se encuentra en el repo de Practicas de la Uni7) y para tres países: México, Estados Unidos y Ecuador. Los resultados deben guardarse en un una df única y escribirse a un archivo que esté en una carpeta `out` que se llame `busquedaScopus.txt`. 

Tu código para este ejercicio debe estar guardado en un script llamado `Ejercicio_rscopusloop.R`.


### Crear funciones y utilizarlas con `source`


`source` es una función que sirve para correr un script de R **dentro de otro script de R**. Esto permite modularizar un análisis y luego correr una pipeline general, así como tener por separado **funciones propias** (que podemos llamar igual que llamamos las funciones de los paquetes) y que utilizamos mucho en diversos scripts. Este tipo de funciones son las que podemos compartir en Github con otros usuarios y hasta convertirlas en un paquete. 

Ejemplos de cómo utilizar `source`: correr el script del ejercicio anterior desde otro script con la línea.

```{r}
source("Ejercicio_rscopusloop.R")
```
Nota que pare que esto funcione tu working directory debe ser el correcto para leer `Ejercicio_rscopusloop.R` como si fuera un archivo (que lo es).

**Hacer una función propia**:

Este es el [esqueleto de una función escrita dentro de R](http://www.statmethods.net/management/userfunctions.html):

```{r}
myfunction <- function(arg1, arg2, ... ){
statements
return(object)
}
```
**Ojo**: el comando `return` es necesario al final de una función simpre que queramos que dicha función "devuelva" un objeto (por ejemplo una df que creemos como parte de la función). De no poner esta instrucción, la función correrá desde otro script, pero no veremos ningún resultado.

 
Ejemplo:

```{r}
give_i_line<- function(file, i){
  ## Arguments 
  # file = path to desired file with the indicadores, must be tab delimited and do NOT have a header
  # number of line of file we want to print

  ## Function
  # read indicadores list
  indicador<-read.delim(file, header=FALSE, quote="", stringsAsFactors=FALSE)

  # give text of the i line of the file  
  x<-indicador[i,1]
  return(x)
  } 

```

Si guardamos la función como un script llamado [`give_i_line.r`](../Practicas/Uni7/bin/give_i_line.r) después podemos correrlo desde otro script:

```{r} 
source("give_i_line.r")
give_i_line("../data/indicadores.txt"), i=2)
```

Nota que `source` NO corre la función en sí, sino que solo la carga al cerebro de R para que podamos usarla como a una función cualquiera de un paquete.

**Ejercicio:** Escribe una función llamada `calc.tetha` que te permita calcular tetha dados Ne y u como argumentos. Recuerda que tetha =4Neu.

**Ejercicio:** Escribe una función que te permita leer un archivo de indicadores y realizar una búsqueda de todos los indicadores del archivo como en el ejercicio del script `Ejercicio_rscopusloop.R`. Uno de los argumentos de tu función debe ser "country" de manera que sea posible utilizar la función para correr la misma búsqueda con diferente país. El nombre de tu función debe ser `search_IndicadoresCountry`. Después en un script utiliza esa función para correr la búsqueda para dos países de tu elección, guarda los resultados en una df e imprímela en pantalla.


### Operador "Forward pipe" `%>%`
El forward pipe `%>%` pertenece al paquete `magrittr`. Puedes encontrar [más info y tutoriales aquí](https://cran.r-project.org/web/packages/magrittr/vignettes/magrittr.html). 

Cuando uno hace varias operaciones es difícil leer y entender el código.

Por ejemplo (asumiendo que hemos cargado la matriz de datos de maiz de los ejercicios anteriores con `fullmat<- read.delim("../meta/maizteocintle_SNP50k_meta_extended.txt"`)


```{r}
# Estimar la altitud media a la que fueron colectadas las muestras que fueron muestreadas a una latitud menor a 20?
x<-mean(fullmat[fullmat$Latitud >20, 16], na.rm = TRUE)

```

La dificultad radica en que usualmente los parámetros se asignan después del 
nombre de la función usando `()`. El operador "Forward Pipe" (`%>%`) cambia este 
orden, manera que un parámetro que precede a la función es enviado ("piped") a 
la función, similar a como vimos en ´bash´ con ´|´.

Veamos como cambia el código anterior:

```{r}
library("magrittr")
# Estimar la altitud media a la que fueron colectadas las muestras que fueron muestreadas a una latitud menor a 20?
x<-fullmat[fullmat$Latitud >20, 16] %>%
  mean
```

podemos leer %>% como "_después_". De modo que si asumimos que cada paso es una función podríamos tener código así:

```{r}
result <- datos %>% paso_uno() %>% paso_dos() %>% paso_tres()
```

Otro ejemplo ([tomado de aquí](http://grunwaldlab.github.io/Population_Genetics_in_R/Getting_ready_to_use_R.html)):

```{r}
library("poppr")
library("magrittr")
data(Pinf)

# Compare the traditional R script

allelic_diversity <- lapply(seppop(clonecorrect(Pinf, strata = ~Continent/Country)), 
                            FUN = locus_table, info = FALSE)

# versus the magrittr piping:

allelic_diversity <- Pinf %>%
  clonecorrect(strata= ~Continent/Country) %>% # clone censor by continent and country.
  seppop() %>%                                # Separate populations (by continent)
  lapply(FUN = locus_table, info = FALSE)     # Apply the function locus_table to both populations

```

**Ejercicio**
A partir de sólo con las muestras de los estados Puebla, Jalisco, Yucatan crea una df que contenga las columnas NSiembra, Raza y Altitud de las muestras de Puebla ordenadas de menor a mayor altitud.


### Manipulación y limpieza de datos

La manipulación y la limpieza da datos muchas veces es necesaria antes de poner hacer análisis en R. Aquí trataremos brevemente lo siguientes puntos en notas aparte:

* Reestructura de datos y el principio de los datos limpios.

* Estrategia divide-aplica-combina.


## 7.3. Graficar en R 		

Los apuntes de esta sección están en [Graficar en R](Graficar_en_R.html) (código y gráficas) y [Graficar en R](Graficar en R.Rmd) (sólo código)

## 7.4. Bioconductor y paquetes bioinformáticos en R

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