# Unidad 4 Uso general de software especializado

## 4.1. Utilidad de software especializado 		

El software especializado permite realizar operaciones complejas con datos genéticos y preguntas biológicas de un tipo particular. 

Por ejemplo el ensamblado *de novo* de datos de GBS/RAD, puede hacerse con diferente software dependiendo de si las preguntas biológicas están enfocadas en genética de poblaciones (Stacks), filogenética (pyRAD) o diversidad de cultivos (UNEAK-TASSEL). 


## 4.2. Cómo entender la instalación y documentación de software especializado

### Instalación 
El software especializado en bioinformática en su mayoría corre directamente desde la línea de comando en Linux o Mac y está escrito en lenguajes como C++, python y Perl, entre otros. Por ende, su instalación no es dar dos clicks, sino realizar una serie de pasos, en su mayoría involucrando los siguientes:

1) Busca la versión más reciente del software especializado de tu interés. Por lo general tienen su propia página en algún rincón del internet.

Veamos dos ejemplos:

[VCFtools](http://vcftools.github.io/index.html)
[pyRAD](http://dereneaton.com/software/pyrad/)

2) Busca la sección de **Download**, o **Install**. Normalmente te llevarán a bajar un tar o a un comando para bajar el tar desde Github. 

**Ojo**: si hay una sección que diga "Computing Requirements" o "Specs" checa eso primero. E.g: para [Trinity](https://github.com/trinityrnaseq/trinityrnaseq/wiki/Trinity-Computing-Requirements).

3). Baja el **source code** del programa.

Si vemos el contenido de los tar que bajamos veremos algo así:

![content_tar_software_eg.png](content_tar_software_eg.png)

4. Por lo general el tar con el source code incluye un archivo de texto (o Markdown) llamado **README**, pero también puede llamarse **INSTALL**. Este es el primer archivo que siempre debemos consultar (y si tanto README como INSTALL existen, primero README).

Así se ve el de pyRAD:

![pyRAD_README.png](pyRAD_README.png)

Y así el de VCFtools:

![VCF_README.png](VCF_README.png)

5. La instalación consiste en seguir los pasos que nos dice el README (o el link que contenga el README, a veces pasa).

**Puntos a observar**: 

* La instalación varía de programa a programa
* La instalación puede requerir los comandos:
  - `sudo`
  - `./configure`
  - `make`
  - `make install`
* Nuestro software de interés puede requerir **dependencias**, es decir otros programas o librerías (de python, Perl, etc) para poder correr. 
* Algunas de esos otros programas pueden instalarse a través de programas para instalar cosas, como `pip`, `brew`, etc. 

#### ¿Qué hacen `sudo`, `./configure`, `make` y `make install`?

Bonita referencia [aquí](https://robots.thoughtbot.com/the-magic-behind-configure-make-make-install)

#####`sudo`: 

Te vuelve el *super usuario*, es decir eres un todo poderoso administrador que puede hacer lo que sea con la línea de comando sin que la computadora te diga que no.

xkcd lo explica así: 

![http://imgs.xkcd.com/comics/sandwich.png](http://imgs.xkcd.com/comics/sandwich.png)

Debemos usar `sudo` ya que al correr como usuarios normales no tenemos privilegios de administrador, lo cual es una medida de seguridad para que no corran programas que se metan con nuestro sistema sin nuestra autorización, y también para revisar que sabes lo que haces antes de modificar algo importante en el sistema. 


##### `./configure`:

Para correr esto primero **debes** estar en el tar (descomprimido) del programa que acabas de bajar. La razón es que esta línea de comando corre un script llamado `configure` (que es un ejecutable) que **viene con tu programa**. 

Un script `configure` básicamente revisa que la computadora donde vas a instalar el programa tenga las dependencias que el programa necesita. En ocasiones puede decirte que no las tiene, pero que amablemente las baja por ti. En tal caso te lo preguntará, con al final de la pregunta un paréntesis así `(Y/n)`, tienes que decirle si Yes or Not. 

Si algunos de los requisitos importantes no se puede conseguir `configure` marcará error y no podrás continuar con la instalación hasta que tengas esas dependencias en orden (o sea que las instales por ti misma). Este suele ser el paso más doloroso de instalaciones difíciles.

Si todo sale bien configure habrá **creado** un nuevo archivo en nuestro WD (que sigue siendo el descomprimido del tar del programa en cuestión) llamado **MakeFile**, puedes pasar al siguiente paso:

##### `make`:

`make` es un programa de Unix que corre un archivo `MakeFile` que se encuentre en el WD. Este archivo (que creamos con `configure` en el paso anterior) es ligeramente diferente dependiendo de cada computadora, es decir, está personalizado para tu computadora, por eso no viene en el tar que bajamos. 

El `MakeFile` indica la secuencia de comandos que se necesitan seguir para construir (*build*) los componentes o sub-programas del software y crea los ejecutables necesarios. A esto también se le conoce como *compilación*.

Si todo sale bien, puedes seguir al último paso:

##### `make install`: 

`make install` también corre el archivo `MakeFile`, pero sólo una sección dentro de dicho archivo llamada **Install**. Esta sección contiene instrucciones para que los archivos creados por el paso anterior (`make`) se copien a sus directorios destino dentro de tu computadora, por ejemplo `/usr/local/bin` para que cualquier usuario los pueda correr. Si fue necesario instalar dependencias, estas también se copiarán al lugar que les corresponda (se crearon en el paso anterior, pero vivían en un directorio temporal). 

Muy probablemente en este paso tu terminal te dirá que no tienes autorización (`Permission denied`) si intentas correr `make install`. Aquí es cuando entra `sudo`, así:

`sudo make install`

(Te pedirá tu pasword, dáselo). 


### Documentación 

La **documentación** de un programa bioinformático (y de cualquier software) se refiere al **manual** y tutoriales asociados al programa. 

Dos maneras de encontrar el manual:

* Dentro del programa (e.g. `man vcftools` o `vcftools -help`)
* En internet (en la página del software).

La complejidad del manual depende de la complejidad de la herramienta en sí. Si es algo que involucre varios pasos y analizar (en vez de solo e.g. reformatear) datos lo más recomendable es dedicarle una tarde (o semana) entera a correr y entender paso por paso un tutorial. Otras cosas sencillas pueden entenderse dándole un vistazo al manual. 

Vamos a ver algunos ejemplos de manuales online:

* [VCFtools](https://vcftools.github.io/man_latest.html)
* [Stacks](http://catchenlab.life.illinois.edu/stacks/manual/)
* [Mothur](http://www.mothur.org/wiki/Mothur_manual) 
* [Trinity](https://github.com/trinityrnaseq/trinityrnaseq/wiki/Running%20Trinity)

**Ejercicio**: encuentra la documentación de un programa que se utilice con tu tipo de datos.
¿Explica la instalación, si sí, cuáles son los pasos?
¿Puedes encontrar de un vistazo lo que te interesa saber cómo hacer?
¿Cuenta con un tutorial?  
¿Cuánto tiempo crees te tomará correr el tutorial?

### Docker

![https://upload.wikimedia.org/wikipedia/commons/7/79/Docker_(container_engine)_logo.png](https://upload.wikimedia.org/wikipedia/commons/7/79/Docker_(container_engine)_logo.png)

Docker sirve para crear **contenedores** y poner dentro de ellos un software (o varios) junto con todo lo que necesitan para correr: su sistema de archivos, código, herramientas del sistema, librerías, etc, cualquier cosa que normalmente podamos instalarle a un sistema operativo.

Terminología básica:

* Un **contenedor** es una versión de Linux reducida a sus componentes más básicos. 

* Una **imagen** es el software que cargamos en un contenedor. 

* Un **dockerfile** es un script que describe (e instala) el software que pondremos en una imagen, pero esto no incluye sólo el programa en sí, sino también cualquier detalle de la configuración del ambiente y hasta los comandos que queremos corra.


![docker_layered.png](docker_layered.png)


Esto nos permite que un programa corra de manera idéntica sin importar el sistema operativo original del equipo, y hace que la instalación sea independiente de la instalación de otro software. Esto es importante porque al instalar un programa bioinformático es común "romper" las dependencias de otro programa.

Funciona también con Windows (7 onwards, 64 bit). Por lo que esto es una alternativa a hacer una partición de disco o a correr Ubuntu/Biolinux desde VirtualBox (docker es mucho más ligero, aunque hagan cosas parecidas).

![docker_VMvsDocker.PNG](docker_VMvsDocker.PNG)

En el siguiente link puedes encontrar las instrucciones para instalar Docker en tu computadora (cambiar tutorial según OS). Traerlo instalado para la próxima clase.

[Tutorial instalación y primeros pasos de Docker](https://docs.docker.com/mac/).

Y aquí unos videos de referencias extra, por si les quieres dar un ojo: [Tutoriales en video](https://training.docker.com/self-paced-training).

#### Ejemplo de funcionamiento básico de docker:

1) Primero prendemos la máquina (para poder correr los comandos de docker, esto es similar a prender una máquina virtual en VirtualBox). 

* En Mac o Linux desde la terminal:
`docker-machine start default`

* En Windows o Mac:
Click en QuickStartTerminal

Nota: al correr desde QuickStartTerminal los comandos son `docker OPTIONS`, mientras que si lo hacemos desde la terminal normal es necesario escribirlo así: `docker $(docker-machine config default) OPTIONS`. Se ve más engorroso, pero permite quitar una capa extra (el QuickSratTerminal) y que montar volúmenes sea más sencillo. Esto lo veremos adelante, por lo pronto, volvamos al ejemplo. 

2) Bajamos la última versión de ubuntu con `pull`:

```
$ docker pull ubuntu #Baja la última versión de ubuntu 
Using default tag: latest
latest: Pulling from library/ubuntu

5a132a7e7af1: Pull complete 
fd2731e4c50c: Pull complete 
28a2f68d1120: Pull complete 
a3ed95caeb02: Pull complete 
Digest: sha256:4e85ebe01d056b43955250bbac22bdb8734271122e3c78d21e55ee235fc6802d
Status: Downloaded newer image for ubuntu:latest
```
 
Aquí por default bajó la última, pero también hubieramos podido especificar qué versión de ubuntu queríamos, así:  `docker pull ubuntu:14.04`
 
Para revisar hayamos bajado la imagen deseada:

```
$ docker images #Enlista imagenes ya bajadas
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
ubuntu              latest              07c86167cdc4        11 days ago         188 MB
hello-world         latest              690ed74de00f        5 months ago        960 B
docker/whalesay     latest              6b362a9f73eb        9 months ago        247 MB
```    

3) Cargamos la imagen dentro de un contenedor con `run`. Voilá, estamos dentro de un Ubuntu, específicamente dentro de un **contenedor** corriendo Ubuntu.
      
```
$ docker run -it ubuntu bash
root@740df4e6d81e:/# 
root@740df4e6d81e:/# ls
bin   dev  home  lib64  mnt  proc  run   srv  tmp  var
boot  etc  lib   media  opt  root  sbin  sys  usr
```

**Pregunta**: ¿Qué significa el `#` en vez del `$`?


4) Es una versión tan básica de Ubuntu que prácticamente nada viene pre-instalado, y si sí, no en su última versión. Por eso es buena idea correr `apt-get update`:

```
# apt-get update
Ign http://archive.ubuntu.com trusty InRelease
Get:1 http://archive.ubuntu.com trusty-updates InRelease [65.9 kB]
Get:2 http://archive.ubuntu.com trusty-security InRelease [65.9 kB]
Hit http://archive.ubuntu.com trusty Release.gpg     
Hit http://archive.ubuntu.com trusty Release         
Get:3 http://archive.ubuntu.com trusty-updates/main Sources [328 kB]
Get:4 http://archive.ubuntu.com trusty-updates/restricted Sources [5217 B]
Get:5 http://archive.ubuntu.com trusty-updates/universe Sources [190 kB]
Get:6 http://archive.ubuntu.com trusty-updates/main amd64 Packages [910 kB]    
Get:7 http://archive.ubuntu.com trusty-updates/restricted amd64 Packages [23.5 kB]
Get:8 http://archive.ubuntu.com trusty-updates/universe amd64 Packages [440 kB]
Get:9 http://archive.ubuntu.com trusty-security/main Sources [134 kB]          
Get:10 http://archive.ubuntu.com trusty-security/restricted Sources [3920 B]   
Get:11 http://archive.ubuntu.com trusty-security/universe Sources [39.1 kB]    
Get:12 http://archive.ubuntu.com trusty-security/main amd64 Packages [542 kB]  
Get:13 http://archive.ubuntu.com trusty-security/restricted amd64 Packages [20.2 kB]
Get:14 http://archive.ubuntu.com trusty-security/universe amd64 Packages [162 kB]
Get:15 http://archive.ubuntu.com trusty/main Sources [1335 kB]                 
Get:16 http://archive.ubuntu.com trusty/restricted Sources [5335 B]            
Get:17 http://archive.ubuntu.com trusty/universe Sources [7926 kB]             
Get:18 http://archive.ubuntu.com trusty/main amd64 Packages [1743 kB]          
Get:19 http://archive.ubuntu.com trusty/restricted amd64 Packages [16.0 kB]    
Get:20 http://archive.ubuntu.com trusty/universe amd64 Packages [7589 kB]      
Fetched 21.5 MB in 27s (778 kB/s)                                              
Reading package lists... Done
```

5) Y ahora sí, podemos instalar herramientas, por ejemplo `curl`:

```
# apt-get install curl
```

6) Cuando termines puedes salir (`exit`) de este contenedor. Los cambios que hayas hecho **no se guardarán en la imagen**, pero **sí en el contenedor que se creó al correrla**. 

Vamos a ver qué contenedores tenemos:

```
$ docker ps  
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                    PORTS               NAMES
a5864268eadd        ubuntu              "bash"              46 hours ago        Up 7 minutes                            sleepy_pasteur
```

Ese es nuestro contenedor. Se encuentra corriendo (aunque no haga nada). Para volver a entrar a él utilizamos `exec`:

```
$ docker exec -it a5864268eadd bash
root@a5864268eadd:/#
root@a5864268eadd:/# mkdir Prueba # hacer un directorio prueba
root@a5864268eadd:/# ls
Prueba  bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
```
(nota que el texto alfanumérico después de `exec` es el ID del container. 

Si nos salimos (`exit`) y luego queremos detenerlo por completo:

```
$ docker stop a5864268eadd 
```

Si enlistamos con `docker ps` los contenedores corriendo ya no tendremos ningún resultado. Sin embargo, aún podemos ver ver otros contenedores no activos:

```
$ docker ps -a 
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                    PORTS               NAMES
a5864268eadd        ubuntu              "bash"              46 hours ago        Exited (0) 32 hours ago                       sleepy_pasteur
28500c7d3069        ubuntu              "bash"              46 hours ago        Exited (0) 46 hours ago                       elegant_yalow
ee966523a24f        hello-world         "/hello"            46 hours ago        Exited (0) 46 hours ago                       tiny_feynman
f09c940dfdc9        docker/whalesay     "cowsay boo"        46 hours ago        Exited (0) 46 hours ago                       big_einstein
d44c3d46c6f9        hello-world         "/hello"            46 hours ago        Exited (0) 46 hours ago                       mad_euclid
e5af547543fa        ubuntu              "/bin/bash"         46 hours ago        Exited (0) 46 hours ago                       determined_mccarthy
a638c4048191        ubuntu              "/bin/bash"         46 hours ago        Exited (0) 46 hours ago                       big_ritchie
5b4ad6c46797        hello-world         "/hello"            46 hours ago        Exited (0) 46 hours ago                       adoring_babbage
```

Si queremos volver a ejecutar un proceso en nuestro contenedor (con `exec` como hicimos arriba) primero necesitamos reiniciarlo (o sea deshacer el stop):

`docker restart a5864268eadd`

Y ya luego podemos volver a entrar a el:

```
docker exec -it a5864268eadd bash
root@a5864268eadd:/# ls
Prueba  bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
```

Nota que los cambios que hayas realizado dentro del contenedor continúan existiendo.

Si quieres borrar contenedores o imágenes (son espacio en disco):

* Borrar un contenedor: Primero deterlo con `docker stop CONTAINER_ID` y luego borrarlo con `docker rm CONTAINER_ID`

* Borrar una imagen: `docker rmi -f IMAGE_ID`


#### Ejemplo de cómo instalar software especializado en un contenedor dentro de docker:


1) Prende la máquina 

Mac con QuickStartTerminal o desde tu terminal con: 

```
$ docker-machine start default
Starting "default"...
(default) Check network to re-create if needed...
(default) Waiting for an IP...
Machine "default" was started.
Waiting for SSH to be available...
Detecting the provisioner...
Started machines may have new IP addresses. You may need to re-run the `docker-machine env` command.
```
Recuerda que si estás en Mac y prendiste la máquina con `docker-machine start dafault` los comandos de abajo deben ir acompañados de `$(docker-machine config default)` por ejemplo `docker $(docker-machine config default) images`.

Windows desde QuickStartTerminal.

Linux: `sudo docker` ... y el comando de docker que desees, o `sudo service docker start` si lo anterior te dice que el demonio no está prendido.


2) Enlista las imagenes:

```
$ docker images
REPOSITORY             TAG                 IMAGE ID            CREATED             SIZE
miproyecto/analisis1   v1                  b951cd1b24b5        12 hours ago        188 MB
ubuntu                 latest              07c86167cdc4        13 days ago         188 MB
hello-world            latest              690ed74de00f        5 months ago        960 B
```

Ya debes tener una imagen de ubuntu (si seguiste el tuturial de la instalación), si no `docker $(docker-machine config default) pull ubuntu`.

3) Corre la imagen de ubuntu dentro de un contenedor, pero **montando un volumen**, es decir un directorio en tu equipo que podrá ser accedido por el contenedor:

```
docker run -v /Users/ticatla/Copy/Science/Teaching/Mx/BioinfInvgRepro/BioinfInvRepro2017-II/Unidad4/Prac_Uni4/DatosContenedor1:/DatosContenedorEjercicioClase -it ubuntu /bin/bash
```

Desglozando el comando anterior:

`-v` es la bandera para indicar que queremos que monte un volumen 

`/Users/ticatla/Copy/Science/Teaching/Mx/BioinfInvgRepro/BioinfInvRepro2017-II/Unidad4/Prac_Uni4/DatosContenedor1` es la ruta absoluta. Sí, absoluta (así que cambiala por la ruta de tu equipo) ya que así es cuando se trata de montar volúmenes :(. Ojo, para windows debes iniciar la ruta con `/c/Users` y después el resto de la ruta.

`:/DatosContenedorEjercicioClase` es el nombre del directorio como quremos que aparezca dentro de nuestro contenedor. 

4) Explora el volumen que montaste, prueba hacer un archivo. Nota que puedes acceder a el desde tu explorador, es decir todo lo que suceda en ese directorio puedes verlo/modificarlo desde dentro y fuera del contenedor. 

```
root@dd4667e94adb:/# ls
DatosContenedorEjercicioClase  bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
root@dd4667e94adb:/# cd DatosContenedorEjercicioClase/
root@dd4667e94adb:/DatosContenedorEjercicioClase# ls
eg_ddRAD_data.fastq
root@dd4667e94adb:/DatosContenedorEjercicioClase# touch Prueba
root@dd4667e94adb:/DatosContenedorEjercicioClase# ls
Prueba  eg_ddRAD_data.fastq
```

5) Actualiza el software instalado y bajar algunos escenciales que no vienen en nuestra imagen de ubuntu down to basics. 

```
apt-get update
apt-get install build-essential
```
6) Ve a la página de [FastX-Tools](http://hannonlab.cshl.edu/fastx_toolkit/download.html) y baja el archivo `fastx_toolkit-0.0.14.tar.bz2` (ojo NO las librerías pre-compiladas). Guarda este archivo en `DatosContenedor1` para que podamos verlo en el volumen `DatosContenedorEjercicioClase`. 

7) Descomprime el archivo que acabas de bajar desde adentro de tu contenedor

`tar -xvf fastx_toolkit-0.0.14.tar.bz2`
(no pego el output de tar por brevedad) Pero aquí el resultado:

```
root@3c3c2e063371:/DatosContenedorEjercicioClase# ls
datos  fastx_toolkit-0.0.14  fastx_toolkit-0.0.14.tar.bz2
root@3c3c2e063371:/DatosContenedorEjercicioClase# cd fastx_toolkit-0.0.14
root@3c3c2e063371:/DatosContenedorEjercicioClase/fastx_toolkit-0.0.14# ls
AUTHORS  ChangeLog  Makefile.am  NEWS    THANKS      build_scripts  config.h.in  configure.ac  galaxy                   m4      scripts
COPYING  INSTALL    Makefile.in  README  aclocal.m4  config         configure    doc           install_galaxy_files.sh  reconf  src
```

8) **Ejercicio** Instala FastX-Tools dentro de un contenedor


#### Cómo instalar software especializado a partir de un dockerfile:


Recordemos que los contenedores de docker son creados a partir de una **imagen**. Dicha imagen puede ser básica, es decir el OS en su forma más simple, pero también puede incluir un software o conjunto de softwares ya instalados y listos para correr, y hasta los comandos que queremos que corra.

Lo anterior se hace a través de un **dockerfile**, es decir un script que describe (e instala) el software que pondremos en una imagen y además incluye cualquier detalle de la configuración del ambiente y hasta los comandos a correr.

Es decir un dockerfile nos permite construir (*build*) y compartir una imagen especializada en correr el proceso que deseemos.

Veamos un ejemplo sencillo de un dockerfile:

```
#####################################################
# Dockerfile ejemplo
# Este dockerfile jala la ultima imagen de Ubuntu y crea una carpeta llamada prueba
## Para construir la imagen basada en este dockerfile escribir en la terminal (WD al docker file)
# docker build -t miproyecto/analisis1:v1 . 

# "miproyecto" es el nombre del repositorio y "analisis1:v1"" el de la imagen y la versión, estos **no** son los nombres de la carpeta y del dockerfile, sino otros que le asignamos.
 
## Para correr un proceso dentro de un contenedor
# docker run -it miproyecto/analisis1:v1 /bin/bash
#####################################################

# Set the base image to Ubuntu
FROM ubuntu:latest

# Crear una carpeta prueba
RUN mkdir /Prueba

# File author
MAINTAINER Alicia Mastretta-Yanes
```

Las instrucciones de cómo utilizarlo vienen al principio del dockerfile, como comentarios:

Para construir la imagen basada en este dockerfile escribir en la terminal (WD al dockerfile, en este caso vive en [Practicas/Uni5/bin/Analisis1](/Unidad4/Prac_Uni4/bin/Analisis1))

`$ docker build -t miproyecto/analisis1:v1 . `

Para correr un proceso dentro del contenedor
`$ docker run -it miproyecto/analisis1:v1 /bin/bash`


Ahora probemos con un dockerfile más complejo, como [este](https://github.com/BioDocker/containers/blob/master/biodocker/Dockerfile) que instala en una base de ubuntu varias herramientas útiles para bioinformática:

```
#################################################################
# Dockerfile
#
# Version:          1
# Software:         BioDocker base Image
# Software Version: 20150814
# Description:      Basic image for BioDocker
# Website:          http://biodocker.org/
# Tags:             Genomics|Proteomics|Transcriptomics|General|Metabolomics
# Provides:         autotools-dev|automake|cmake|curl|fuse|git|wget|zip|openjdk-7-jre|build-essential|pkg-config|python|python-dev|python-pip|zlib1g-dev
# Base Image:       ubuntu:14.04.3
# Build Cmd:        docker build --rm -t biodckr/biodocker .
# Pull Cmd:         docker pull biodckr/biodocker
# Run Cmd:          docker run --rm biodckr/biodocker bash
#################################################################
# Source Image
FROM ubuntu:14.04.3

# Set noninterative mode
ENV DEBIAN_FRONTEND noninteractive

################## BEGIN INSTALLATION ######################

# add apt mirror
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bkp && \
    bash -c 'echo -e "deb mirror://mirrors.ubuntu.com/mirrors.txt precise main restricted universe multiverse\n\
deb mirror://mirrors.ubuntu.com/mirrors.txt precise-updates main restricted universe multiverse\n\
deb mirror://mirrors.ubuntu.com/mirrors.txt precise-backports main restricted universe multiverse\n\
deb mirror://mirrors.ubuntu.com/mirrors.txt precise-security main restricted universe multiverse\n\n" > /etc/apt/sources.list' && \
    cat /etc/apt/sources.list.bkp >> /etc/apt/sources.list && \
    cat /etc/apt/sources.list

# apt update and install global requirements
RUN apt-get clean all &&\
    apt-get update &&\ 
    apt-get upgrade -y && \
    apt-get install -y  \
        autotools-dev   \
        automake        \
        cmake           \
        curl            \
        fuse            \
        git             \
        wget            \
        zip             \
        openjdk-7-jre   \
        build-essential \
        pkg-config      \
        python          \
	python-dev      \
        python-pip      \
        zlib1g-dev && \
    apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#        subversion \
#        mercurial  \
#        cvs        \

# create shared folders
RUN mkdir /data /config

# Add user biodocker with password biodocker
RUN useradd --create-home --shell /bin/bash --user-group --uid 1000 --groups sudo,fuse biodocker && \
    echo `echo "biodocker\nbiodocker\n" | passwd biodocker` && \
    chown biodocker:biodocker /data && \
    chown biodocker:biodocker /config

# Change user
USER biodocker

# Create $HOME/bin folder
RUN mkdir /home/biodocker/bin

# Add $HOME/bin to path
ENV PATH=$PATH:/home/biodocker/bin
ENV HOME=/home/biodocker

# Share default volumes
VOLUME ["/data", "/config"]

# Overwrite this with 'CMD []' in a dependent Dockerfile
CMD ["/bin/bash"]

# change workdir
WORKDIR /data

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>
```

Este dockerfile vive en el [github de Biodocker](https://github.com/BioDocker/). En un momento veremos qué es Biodocker, pero primero sigamos con el ejemplo de nuestro dockerfile. 

Vamos a utilizar ese dockerfile para crear un contenedor:

```
$ docker pull biodckr/biodocker
Using default tag: latest
latest: Pulling from biodckr/biodocker
8387d9ff0016: Already exists 
3b52deaaf0ed: Already exists 
4bd501fad6de: Already exists 
a3ed95caeb02: Pull complete 
1271a85e53b2: Pull complete 
038e0519162f: Pull complete 
b7326f133df8: Pull complete 
174099b62d65: Pull complete 
aed7fb466079: Pull complete 
Digest: sha256:5856e57be18548b8f4244bad94b548a777c1b7261dba896f7ecd09d9a58aefeb
Status: Downloaded newer image for biodckr/biodocker:latest
$
$ docker images 
REPOSITORY             TAG                 IMAGE ID            CREATED             SIZE
miproyecto/analisis1   v1                  b951cd1b24b5        11 days ago         188 MB
ubuntu                 latest              07c86167cdc4        3 weeks ago         188 MB
biodckr/biodocker      latest              5c0a896aa5b1        7 weeks ago         702.5 MB
hello-world            latest              690ed74de00f        5 months ago        960 B
$
$ docker run -it biodckr/biodocker /bin/bash
biodocker@4e415e3c6633:/data$ curl
curl: try 'curl --help' or 'curl --manual' for more information 
```

**Observaciones y preguntas**:

* En vez de ser root (´#´ al inicio de la línea de comando) como es el default de docker, somos un usuario normal y estamos en un directorio llamado ´data´. ¿Con qué líneas del dockerfile se realizó esto?

* `curl` está instalado (el default no es este, según vimos la clase pasada). ¿Con qué líneas del dockerfile se especificó esto?

* Pude hacer un docker pull porque el dockerfile de arriba existe en un repositorio de contenedores llamado `biodckr`. ¿Cuál es la diferencia entre `pull` y `build` an image?

* La línea 81 dice `VOLUME ["/data", "/config"]` ¿Qué significa esto? 

**Ejercicio** ¿Cómo puedo utilizar `run` para que el volumen `data` corresponda a un directorio en mi computadora? 


El contenedor creado a partir de `biodckr/biodocker` ya tiene varias cosas instaladas (como `zlib1g-dev`, que quizá recuerdes), por lo que instalar FastXtools debiera ser más sencillo que desde cero.

Una vez dentro del contenedor:

```
$ #Install Gtextutils
$ wget https://github.com/agordon/libgtextutils/releases/download/0.7/libgtextutils-0.7.tar.gz
$ tar -xvf libgtextutils-0.7.tar.gz
$ cd libgtextutils-0.7 
$ ./configure
$ make
$ sudo make install
$ cd ..
$ #Install FastX
$ wget https://github.com/agordon/fastx_toolkit/releases/download/0.0.14/fastx_toolkit-0.0.14.tar.bz2
$ tar -xvf fastx_toolkit-0.0.14.tar.bz2 
$ cd fastx_toolkit-0.0.14
$ ./configure
$ make
$ sudo make install
$ cd ..
$ rm -rf fas* lib*
```

Lo anterior también podríamos haberlo puesto dentro del dockerfile. ¿No sería genial que existieran dockerfiles así pero para instalar ese software que tanto necesitas? Pues bien, ya hay dos proyectos que están dockerizando software bioinformático:

* **[Biodocker](http://biodocker.org/)**
* **[Bioboxes](http://bioboxes.org/)**

Como notamos, ambos se parecen mucho, la diferencia principal es que Bioboxes pide tener instalado `phyton` y `pip` para no interactuar directamente con docker. Biodocker no requiere instalar nada extra y además tiene actualmente más [contenedores](https://github.com/BioDocker/containers), así que es en el que me enfocaré, pero tu puedes usar y **contribuir** al que te convenga más. 

### Comandos de un docker file
Referencia: [Docker Explained: Using Dockerfiles to Automate Building of Images](https://www.digitalocean.com/community/tutorials/docker-explained-using-dockerfiles-to-automate-building-of-images)

La sintaxis de un dockerfile consite en comentarios y comandos más argumentos. 

Los comandos de docker se escriben con MAYÚSCULA y, al igual que en cualquier script, deben presentarse en forma secuencial. Son los siguientes:

* `FROM` debe ser el primer comando dentro de un dockerfile, define a partir de qué imagen se va a crear el contenedor. 

```
# Usage: FROM [image name]
FROM ubuntu
```

* `RUN` es el comando central de los dockerfiles. Toma el comando que se le de (por ejemplo uno de bash) y lo ejecuta para **construir** la imagen. 

```
# Usage: RUN [command]
RUN aptitude install -y riak
```

* `ADD` copia los archivos de un host al sistema de archivos de un contenedor (ie se duplican en tu disco duro), pero la fuente tmb puede ser una URL, de modo que su contenido se baja y guarda en el contenedor.

```
# Usage: ADD [source directory or URL] [destination directory]
ADD /my_app_folder /my_app_folder
```

* `CMD` similar a `RUN` pero se ejecuta cuado ya se creó el contenedor al crear una imagen. O sea es el (los) comando(s) que correrá(n) en automático.

```
# Usage 1: CMD application "argument", "argument", ..
CMD "echo" "Hello docker!"
```

* `ENTRYPOINT` especifica cuál será la aplicación default que se utilizará al crear el contenedor. Útil si creaste un contenedor para correr solo esa aplicación en específico.

```
# Usage: ENTRYPOINT application "argument", "argument", ..
# Remember: arguments are optional. They can be provided by CMD
#           or during the creation of a container. 
ENTRYPOINT echo

# Usage example with CMD:
# Arguments set with CMD can be overridden during *run*
CMD "Hello docker!"
ENTRYPOINT echo 
```

* `WORKDIR` define en que directorio se ejecutarán los comandos dados por CMD 


* `ENV` crea las variables del ambiente ([enviromental variables](https://wiki.archlinux.org/index.php/environment_variables)) que pueden ser accedidas por el contenedor y los scripts. 

```
# Usage: ENV key value
ENV SERVER_WORKS 4
```

* `USER` especifica que usuario (username) va a correr el contenedor.

```
# Usage: USER [UID]
USER 751
```

* `VOLUME` monta un directorio del host como un volumen dentro del contenedor. 

```
# Usage: VOLUME ["/dir_1", "/dir_2" ..]
VOLUME ["/my_files"]
```

* `EXPOSE` sirve para abrir un puerto que permita el acceso a la red entre un proceso dentro del contenedor y el mundo exterior 

```
# Usage: EXPOSE [port]
EXPOSE 8080
```

* MAINTAINER quién hizo y da mantenimiento al dockerfile. Puede ir al principio o al final, no es algo que se ejecute, sol da info.

```
# Usage: MAINTAINER [name]
MAINTAINER authors_name authors_contact
```



### Ejercicios 

**Ejercicio:** En un contenedor con FastXtools instalado y con un volumen montado a [Practicas/Uni5/DatosContenedor1/datos](Practicas/Uni5/DatosContenedor1/datos) utiliza una de las herramientas de FastXtools para clipear las secuencias del archivo `datos/eg_ddRAD_data.fastq`.

**Ejercicio:** Utiliza Biodocker para crear un contenedor con alguno de los programas que ya existen en el Github de Biodocker. Esto puede tardar por los downloads necesarios y la red. 

**Ejercicio:** 
a) En un contenedor donde tengas instalado vcftools utiliza un comando para bajar los datos en formato vcf del repositorio Schweizer RM, Robinson J, Harrigan R, Silva P, Galaverni M, Musiani M, Green RE, Novembre J, Wayne RK (2015) Data from: Targeted capture and resequencing of 1040 genes reveal environmentally driven functional variation in gray wolves. Dryad Digital Repository. [http://dx.doi.org/10.5061/dryad.8g0s3](http://datadryad.org/resource/doi:10.5061/dryad.8g0s3)

b) Cambia el nombre del archivo que acabas de bajar a `wolves.vcf`.

c) ¿Cuántos MB pesa el archivo?

d) ¿Cuántos individuos y variantes (SNPs) tiene el archivo?

e) Calcula la frecuencia de cada alelo para todos los individuos dentro del archivo y guarda el resultado en un archivo.

f) ¿Cuántos sitios del archiov no tienen missing data?

g) Calcula la frecuencia de cada alelo para todos los individuos pero solo para los sitios sin missing data y guarda el resultado en un archivo. 

h) ¿Cuántos sitios tienen una frecuencia del alelo menor <0.05?

i) Calcula la heterozygosidad de cada individuo.

j) Calcula la diversidad nucleotídica por sitio.

k) Calcula la diversidad nucleotídica por sitio solo para los sitios del cromosoma 3

l) Filtra los sitios que tengan una frecuencia del alelo menor  <0.05 y crea un archivo nuevo llamado `wolves_maf05.vcf`.

m) Convierte el archivo `wolves_maf05.vcf` a formato plink. 

**Ejercicio**
Formen equipos de 3-5 personas con un tipo de datos/tema en común. Discutan qué software especializado utilizarían para sus datos. ¿Hay un dockerfile para este programa? Si sí, pullen la imagen a su docker. Si no, instalenlo dentro de un contenedor. Guarden una lista de los comandos que utilizaron para hacerlo, para que después pudieran hacer un dockerfile a partir de ellos.
 
