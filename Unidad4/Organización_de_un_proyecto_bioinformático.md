# Unidad 4 Organización de un proyecto bioinformático 


Un proyecto bioinformático consiste en los datos crudos, datos procesados, scripts y documentación (README) necesarios para reproducir los análisis realizados. Es decir en todo lo que al final debes subir a un repositorio como Dryad (aunque los datos pueden conectarse desde otros repos, como SRA, claro). 


## 4.1. Organización de directorios 

Un proyecto bioinformático debe tener su propio **directorio** (carpeta) y contener en subdirectorios todo lo necesario para realizarlo.

El directorio del proyecto debe dividirse a su vez, lo recomendable es que sea en **subdirectorios** parecidos a los siguientes:

* **data**, contiene los datos, también puede tener otros nombres como *genetic* para datos genéticos y *spatial* para datos espaciales. Los datos genéticos pueden dividierse a su vez en subdirectorios como *raw*, *filtered*, *genotypes*, *data_in*, *data_out* de modo que los datos crudos estén en un directorio y los modificados por análisis subsecuentes en otros directorios. El punto es tener uno o más directorios donde estén todos los datos.  

* **meta**, **info** o **docs** donde puedes guardar todos los metadatos, como un archivo cvs detallando información de cada una de las muestras. Si lo prefieres este archivo puede ir dentro del directorio de datos sin necesidad de hacer la carpeta *meta*. También es posible guardar aquí cualquier otro documento necesario para procesar los datos.
  		
* **bin** o **scripts**, donde guardas todos los scripts necesarios para correr el análisis de principio a fin. Este es un directorio obligatorio. Esta es la carpeta más difícil de documentar.

* **figures**, opcionalmente, puedes poner aquí el código que se utilice sólo para hacer las figuras de una publicación dada. Es como un extracto de *bin* dedicado solo a esto.

* **archive** este directorio NO se sube al repositorio, pero es bueno tenerlo para ir poniendo ahí scripts y resultados que crees no necesitar más pero que es bueno no borrar por completo.

También es posible tener un directorio para cada subanálisis concreto, por ejemplo uno para *stacks* y otro para *admixture*, pero dentro de cada uno de ellos subdirectorios como los anteriores. 

Independientemente del nombre que escojamos para los directorios y archivos, qué es qué y dónde está cada cosa debe ir explicado en un **README**.

**Pregunta:** Si haces un dockerfile como parte de tu proyecto ¿Dónde lo guardarías?


## 4.2. Organización de scripts 
Como hemos visto, un script puede realizar un análisis sencillo o "disparar" otros scripts para correr una pipeline completa. También es posible que algunos de tus scripts sean *funciones* a ser utilizadas por otros scripts (por ejemplo con el comando `source()` en R) y otros scripts  

Los scripts dentro de un proyecto bioinformático normalmente incluyen los tres tipos anteriores. 

Una buena práctica es **no** escribir scripts bíblicos que lo hagan todo, sino ir partiendo el análisis por "módulos". 

**Pregunta**: ¿en qué módulos podrías dividir tu proyecto?

Para recordar qué correr en qué orden puedes "numerar" tus scripts, de modo que el primer script que debas utilizar se llame por ejemplo `1.demultiplexing.sh` y el siguiente `2.Qfiltering.sh` y así. Las funciones y scripts "llamados" no es necesario funcionarlas. 

Al final deberás incluir en tu README una pequeña explicación de qué hace cada script. 
		
## 4.3. Markdown 		

Markdown es el formato en el que está escrito este repositorio y el que ocupan sitios como Github, Stacksoverflow y muchos tutoriales. 

Básicamente es una manera de escribir texto de manera que sea interpretado por un programa y convertido en un bonito archivo html. Tiene la ventaja de que está especialmente hecho para poder `formatear código en un texto como este`.

[Aquí una guía de MarkDown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)

**Ejercicio:** abre el el editor de Markdown de tu preferencia y escribe un texto en formato Markdown de manera que quede igual que los tres primeros puntos de [Preparing the environment, cleaning the data for Stacks](http://catchenlab.life.illinois.edu/stacks/tut.php#prep) (incluyendo ese subtítulo). 

Es útil aprender la sintaxis de Markdown para poder documentar mejor tus proyectos, sobretodo si los subes a GitHub. 


## 4.4. Control de versiones 

El control de versiones se refiere a llevar un registro de los cambios que se realizan sobre un proyecto informático, particularmente sobre las modificaciones a los scripts.

Uno de los sistemas más utilizados de control de versiones es [`git`](https://git-scm.com/). Su principal ventaja es que no sólo puede llevar proyectos individuales, sino que está diseñado para proyectos colaborativos donde varias personas escriben código al mismo tiempo. ¿Creías que GoogleDocs era innovador? 

Es muy buena idea llevar un control de versiones de tus scrips en tu carpeta `bin`. Esto puedes hacerlo por ejemplo con Github.

## 4.5. Github

Github es un repositorio de código online basado en `git`. 

Veamos la página de este repositorio en [GitHub](https://github.com/AliciaMstt/BioinfInvRepro2016-II).

La parte de arriba enlista los archivos y carpetas dentro del repositorio. La nota de texto a su derecha es el comentario que yo realicé al subir o modificar (commit) el archivo de mi computadora a GitHub. En la parte de abajo puedes leer el contenido de dichos archivos en formato html, pero también en su forma "cruda".

**Pregunta:** ¿a qué me refiero con "su forma cruda"?

Github tiene todas las funcionalidades de la línea de comando de  `git`, pero además una interfase online y una [versión de escritorio](https://desktop.github.com/). 

La función más importante de `git` es `commit`. Es como "salvar los cambios" que hemos hecho a un script, pero en vez de solamente al archivo, al repositorio. Es decir, no puede modificar y guardar un script, pero estos cambios no se reflejarán en el repositorio que hayamos creado con `git` hasta que utilicemos `commit`. Importante: `commit` siempre va acompañado de una descripción, es decir de un pequeño resumen de qué fue el cambio que hicimos. Por ejemplo: "corrección de bug que causaba sólo se procesaran las 10 primeras muestras" o "integración de nuevo filtro de limpieza con la herramienta clipper de FastXtools". 


**Ejercicio:** abre una cuenta de GitHub y [sigue este tutorial](https://guides.github.com/activities/hello-world/). 

**Ejercicio:** Baja GitHub Desktop y baja este repositorio.

**Ejercicio:** Utilizando GitHub Desktop crea un repositorio dentro de una carpeta donde tengas guardados una serie de scripts.  
