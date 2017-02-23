# Unidad 4 Uso general de software especializado

## 4.1. Docker

![https://upload.wikimedia.org/wikipedia/commons/7/79/Docker_(container_engine)_logo.png](https://upload.wikimedia.org/wikipedia/commons/7/79/Docker_(container_engine)_logo.png)

Docker sirve para crear **contenedores** y poner dentro de ellos un software (o varios) junto con todo lo que necesitan para correr: su sistema de archivos, código, herramientas del sistema, librerías, etc, cualquier cosa que normalmente podamos instalarle a un sistema operativo.

Terminología básica:

* Un **contenedor** es una versión de Linux reducida a sus componentes más básicos. 

* Una **imagen** es el software que cargamos en un contenedor. 

* Un **dockerfile** es un script que describe (e instala) el software que pondremos en una imagen, pero esto no incluye sólo el programa en sí, sino también cualquier detalle de la configuración del ambiente y hasta los comandos que queremos corra.


![docker_layered.png](docker_layered.png)


Esto nos permite que un programa corra de manera idéntica sin importar el sistema operativo original del equipo, y hace que la instalación sea independiente de la instalación de otro software. Esto es importante porque al instalar un programa bioinformático es común "romper" las dependencias de otro programa.


![docker_VMvsDocker.PNG](docker_VMvsDocker.PNG)

En el siguiente link puedes encontrar las instrucciones y primeros pasos para utilizar Docker.

[Tutorial instalación y primeros pasos de Docker](https://docs.docker.com/mac/).

Para probar que Docker está funcionando correctamente deberás correr `docker run hello-world` y obtener:

```
$ docker run hello-world
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
78445dd45222: Pull complete 
Digest: sha256:c5515758d4c5e1e838e9cd307f6c6a0d620b5e07e6f927b07d05f6d12a1ac8d7
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://cloud.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/engine/userguide/

```


Y aquí unos videos de referencias extra, por si les quieres dar un ojo: [Tutoriales en video](https://training.docker.com/self-paced-training).

#### Cómo iniciar Docker:

Para inciar Docker  primero prendemos la máquina (para poder correr los comandos de docker, esto es similar a prender una máquina virtual en VirtualBox). 

Puede ser que la máquina ya esté prendida, para averiguarlo puedes correr un comando como:

`docker ps` o (en Linux sobretodo) `sudo docker ps` (te pedirá tu  contraseña).

Si obtienes algo parecido a esto todo está en orden.

```
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
```

Si obtienes un error  como "Cannot connect to the Docker daemon. Is the docker daemon running on this host?" Entonces deberás iniciar la máquina:

* En Mac desde la terminal:
`docker-machine start default`

* En Linux: 
`sudo service docker start`

* En Windows o Mac:
Click en QuickStartTerminal o el ícono de Docker. Dependiendo de tu sistema esto abrirá una terminal con docker corriendo o prenderá docker (probablemente lo verás en el menú cerca de donde está el wireless de tu compu) de manera que ya podrás utilizar `docker OPTIONS` desde tu terminal.


#### Funcionamiento básico de Docker 

La sintaxis de docker es: `docker OPTIONS`. En Linux probablemente tendrás que correrlo con `sudo` (veremos qué es más adelante) antes. Así: `sudo docker OPTIONS`. Te pedirá tu password (el que usas para entrar a tu computadora). 

Las opciones más importanes de Docker son:

* `pull` una imagen (solo la primera vez)
* `run` la imagen dentro de un contenedor (para crearlo, solo la primera vez)
*  `exit` para salir del contendor
*  `stop` para detener un contenedor 
*  `restart` para reactivar un contenedor
*  `exec` para entrar a un contenedor activo
*  `rm` borrar un contenedor (debes `stop` primero).
*   `rmi` borrar una imagen. 

Veámoslo con un ejemplo:


1) Bajar (*pullear*) una imagen con `pull`. Por ejemplo la última versión de ubuntu: 

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

2) Cargamos la imagen dentro de un contenedor con `run`. Voilá, estamos dentro de un Ubuntu, específicamente dentro de un **contenedor** corriendo Ubuntu.
      
```
$ docker run -it ubuntu bash
root@740df4e6d81e:/# 
root@740df4e6d81e:/# ls
bin   dev  home  lib64  mnt  proc  run   srv  tmp  var
boot  etc  lib   media  opt  root  sbin  sys  usr
```

**Pregunta**: ¿Qué significa el `#` en vez del `$`?


3) Es una versión tan básica de Ubuntu que prácticamente nada viene pre-instalado, y si sí, no en su última versión. Por eso es buena idea correr `apt-get update`:

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

5) Cuando termines puedes salir (`exit`) de este contenedor. Los cambios que hayas hecho **no se guardarán en la imagen**, pero **sí en el contenedor que se creó al correrla**. 

Vamos a ver qué contenedores tenemos:

```
$ docker ps  
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                    PORTS               NAMES
a5864268eadd        ubuntu              "bash"              46 hours ago        Up 7 minutes                            sleepy_pasteur
```

Ese es nuestro contenedor. Se encuentra corriendo (aunque no haga nada). Para volver a entrar a él utilizamos `exec` y su ID:

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

Si enlistamos con `docker ps` los contenedores corriendo ya no tendremos ningún resultado. Sin embargo, aún podemos ver ver otros contenedores no activos (abajo son los ejemplos en mi sistema, será diferente en el tuyo dependiendo qué contenedores tengas).

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


#### "Conectar" un contenedor con un directorio dentro del OS nativo, aka "montar un volumen":

Ejemplo con una imagen de Ubuntu.

1) Enlista las imagenes para asegurarte tener una de Ubuntu:

```
$ docker images
REPOSITORY             TAG                 IMAGE ID            CREATED             SIZE
miproyecto/analisis1   v1                  b951cd1b24b5        12 hours ago        188 MB
ubuntu                 latest              07c86167cdc4        13 days ago         188 MB
hello-world            latest              690ed74de00f        5 months ago        960 B
```

Ya debes tener una imagen de ubuntu (si seguiste las notas anteriores), si no `docker  pull ubuntu`.

3) Corre la imagen de ubuntu dentro de un contenedor, pero **montando un volumen**, es decir un directorio en tu equipo que podrá ser accedido por el contenedor:

```
docker run -v /Users/ticatla/hubiC/Science/Teaching/Mx/BioinfInvgRepro/BioinfInvRepro2017-II/Unidad4/Prac_Uni4/DatosContenedor1:/DatosContenedorEjercicioClase -it ubuntu /bin/bash
```

Desglozando el comando anterior:

`-v` es la bandera para indicar que queremos que monte un volumen 

`/Users/ticatla/hubiC/Science/Teaching/Mx/BioinfInvgRepro/BioinfInvRepro2017-II/Unidad4/Prac_Uni4/DatosContenedor1` es la ruta **absoluta**. Sí, absoluta (así que cambiala por la ruta de tu equipo) ya que así es cuando se trata de montar volúmenes :(. Ojo, para windows debes iniciar la ruta con `/c/Users` y después el resto de la ruta.

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



## 4.2. Utilidad de software especializado 		

El software especializado permite realizar operaciones complejas con datos genéticos y preguntas biológicas de un tipo particular. 

Por ejemplo el ensamblado *de novo* de datos de GBS/RAD, puede hacerse con diferente software dependiendo de si las preguntas biológicas están enfocadas en genética de poblaciones (Stacks), filogenética (pyRAD) o diversidad de cultivos (UNEAK-TASSEL). 


## 4.3. Instalación de software especializado

### Instalación manual
El software especializado en bioinformática en su mayoría corre directamente desde la línea de comando Unix y está escrito en lenguajes como C++, python y Perl, entre otros. Por ende, su instalación no es dar dos clicks, sino realizar una serie de pasos, en su mayoría involucrando los siguientes:

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

Bonita referencia [aquí](https://robots.thoughtbot.com/the-magic-behind-configure-make-make-install).

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


Vamos a ver un ejemplo en el contenedor de Ubuntu donde montamos el volumen en el ejemplo de funcionamiento de Docker. Esto nos permitirá trabajar todos sobre lo mismo (y no romper nada):

Recuerda primero buscar el ID del contenedor (el ID será diferente en tu computadora) con `docker ps -a`. Luego:


```
$ docker start 8509d265036f
$ docker exec -it 8509d265036f /bin/bash
root@8509d265036f:/# 
```

Empecemos por actualizar el software de ubuntu instalado de base y bajar algunos escenciales que no vienen en nuestra imagen de ubuntu down to basics. 

```
apt-get update
apt-get install build-essential
```


**Ejercicio:**

Ve a la página de [FastX-Tools](http://hannonlab.cshl.edu/fastx_toolkit/download.html) y baja el archivo `fastx_toolkit-0.0.14.tar.bz2` (ojo NO las librerías pre-compiladas). Guarda este archivo en `DatosContenedor1` para que podamos verlo en el volumen `DatosContenedorEjercicioClase`. 

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


#### Instalación a partir de una imagen de Docker

Recordemos que los contenedores de docker son creados a partir de una **imagen**. Dicha imagen puede ser básica, es decir el OS en su forma más simple, pero también puede incluir un software o conjunto de softwares ya instalados y listos para correr, y hasta los comandos que queremos que corra.

Lo anterior se hace a través de un **dockerfile**, es decir un script que describe (e instala) el software que pondremos en una imagen y además incluye cualquier detalle de la configuración del ambiente y hasta los comandos a correr.

Es decir un dockerfile nos permite construir y compartir una imagen especializada en correr el proceso que deseemos. 

Veamos un dockerfile como [este](https://github.com/Biocontainers/containers/blob/master/Biocontainers/Dockerfile) que instala en una base de ubuntu varias herramientas útiles para bioinformática:

(Puedes revisar los comandos de un docker file
en esta referencia: [Docker Explained: Using Dockerfiles to Automate Building of Images](https://www.digitalocean.com/community/tutorials/docker-explained-using-dockerfiles-to-automate-building-of-images)).

```
# Base image
FROM ubuntu:16.04

# Metadata
LABEl base.image="ubuntu:16.04"
LABEL version="4"
LABEL software="Biocontainers base Image"
LABEL software.version="08252016"
LABEL description="Base image for BioDocker"
LABEL website="http://biocontainers.pro"
LABEL documentation="https://github.com/BioContainers/specs/wiki"
LABEL license="https://github.com/BioContainers/containers/blob/master/LICENSE"
LABEL tags="Genomics,Proteomics,Transcriptomics,General,Metabolomics"

# Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>

ENV DEBIAN_FRONTEND noninteractive

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bkp && \
    bash -c 'echo -e "deb mirror://mirrors.ubuntu.com/mirrors.txt xenial main restricted universe multiverse\n\
deb mirror://mirrors.ubuntu.com/mirrors.txt xenial-updates main restricted universe multiverse\n\
deb mirror://mirrors.ubuntu.com/mirrors.txt xenial-backports main restricted universe multiverse\n\
deb mirror://mirrors.ubuntu.com/mirrors.txt xenial-security main restricted universe multiverse\n\n" > /etc/apt/sources.list' && \
    cat /etc/apt/sources.list.bkp >> /etc/apt/sources.list && \
    cat /etc/apt/sources.list

RUN apt-get clean all && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y  \
        autotools-dev   \
        automake        \
        cmake           \
        curl            \
        grep            \
        sed             \
        dpkg            \
        fuse            \
        git             \
        wget            \
        zip             \
        openjdk-8-jre   \
        build-essential \
        pkg-config      \
        python          \
	python-dev      \
        python-pip      \
        bzip2           \
        ca-certificates \
        libglib2.0-0    \
        libxext6        \
        libsm6          \
        libxrender1     \
        git             \
        mercurial       \
        subversion      \
        zlib1g-dev &&   \
        apt-get clean && \
        apt-get purge && \
        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/miniconda/Miniconda2-4.0.5-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh

RUN TINI_VERSION=`curl https://github.com/krallin/tini/releases/latest | grep -o "/v.*\"" | sed 's:^..\(.*\).$:\1:'` && \
    curl -L "https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini_${TINI_VERSION}.deb" > tini.deb && \
    dpkg -i tini.deb && \
    rm tini.deb && \
    apt-get clean

RUN mkdir /data /config

# Add user biodocker with password biodocker
RUN groupadd fuse && \
    useradd --create-home --shell /bin/bash --user-group --uid 1000 --groups sudo,fuse biodocker && \
    echo `echo "biodocker\nbiodocker\n" | passwd biodocker` && \
    chown biodocker:biodocker /data && \
    chown biodocker:biodocker /config

# give write permissions to conda folder
RUN chmod 777 -R /opt/conda/

# Change user
USER biodocker

ENV PATH=$PATH:/opt/conda/bin
ENV PATH=$PATH:/home/biodocker/bin
ENV HOME=/home/biodocker

RUN mkdir /home/biodocker/bin

RUN conda config --add channels r
RUN conda config --add channels bioconda

RUN conda upgrade conda

VOLUME ["/data", "/config"]

# Overwrite this with 'CMD []' in a dependent Dockerfile
CMD ["/bin/bash"]

WORKDIR /data

```

Este dockerfile vive en el [github de Biocontainers](https://github.com/Biocontainers/). 

Vamos a utilizar ese dockerfile para crear un contenedor:

```
$ docker pull 


```

**Observaciones y preguntas**:

* En vez de ser root (´#´ al inicio de la línea de comando) como es el default de docker, somos un usuario normal y estamos en un directorio llamado ´data´. ¿Con qué líneas del dockerfile se realizó esto?

* `curl` está instalado (el default no es este, según vimos la clase pasada). ¿Con qué líneas del dockerfile se especificó esto?

* Pude hacer un docker pull porque el dockerfile de arriba existe en un repositorio de contenedores llamado `biodckr`. 

* La línea 100 dice `VOLUME ["/data", "/config"]` ¿Qué significa esto? 

**Ejercicio** ¿Cómo puedo utilizar `run` para que el volumen `data` corresponda a un directorio en mi computadora? 


El contenedor creado a partir de `biodckr/Biocontainers` ya tiene varias cosas instaladas (como `zlib1g-dev`, que quizá recuerdes), por lo que instalar FastXtools debiera ser más sencillo que desde cero.

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

* **[Biocontainers](http://biocontainers.pro/)**
* **[Bioboxes](http://bioboxes.org/)**

Como notamos, ambos se parecen mucho, la diferencia principal es que Bioboxes pide tener instalado `phyton` y `pip` para no interactuar directamente con docker. Biocontainers no requiere instalar nada extra y además tiene actualmente más [contenedores](https://github.com/Biocontainers/containers), así que es en el que me enfocaré, pero tu puedes usar y **contribuir** al que te convenga más. 


Excelente intro

http://biocontainers.pro/docs/101/intro/




## 4.4. Documentación de software especializado

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

## 4.5. Organización de un proyecto bioinformático 


Un proyecto bioinformático consiste en los datos crudos, datos procesados, scripts y documentación (README) necesarios para reproducir los análisis realizados. Es decir en todo lo que al final debes subir a un repositorio como Dryad (aunque los datos pueden conectarse desde otros repos, como SRA, claro). 


### Organización de directorios 

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


### Organización de scripts 
Como hemos visto, un script puede realizar un análisis sencillo o "disparar" otros scripts para correr una pipeline completa. También es posible que algunos de tus scripts sean *funciones* a ser utilizadas por otros scripts (por ejemplo con el comando `source()` en R) y otros scripts  

Los scripts dentro de un proyecto bioinformático normalmente incluyen los tres tipos anteriores. 

Una buena práctica es **no** escribir scripts bíblicos que lo hagan todo, sino ir partiendo el análisis por "módulos". 

**Pregunta**: ¿en qué módulos podrías dividir tu proyecto?

Para recordar qué correr en qué orden puedes "numerar" tus scripts, de modo que el primer script que debas utilizar se llame por ejemplo `1.demultiplexing.sh` y el siguiente `2.Qfiltering.sh` y así. Las funciones y scripts "llamados" no es necesario funcionarlas. 

Al final deberás incluir en tu README una pequeña explicación de qué hace cada script. 
		
## 4.6. Markdown 		

Markdown es el formato en el que está escrito este repositorio y el que ocupan sitios como Github, Stacksoverflow y muchos tutoriales. 

Básicamente es una manera de escribir texto de manera que sea interpretado por un programa y convertido en un bonito archivo html. Tiene la ventaja de que está especialmente hecho para poder `formatear código en un texto como este`.

[Aquí una guía de MarkDown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)

**Ejercicio:** abre el el editor de Markdown de tu preferencia y escribe un texto en formato Markdown de manera que quede igual que los tres primeros puntos de [Preparing the environment, cleaning the data for Stacks](http://catchenlab.life.illinois.edu/stacks/tut.php#prep) (incluyendo ese subtítulo). 

Es útil aprender la sintaxis de Markdown para poder documentar mejor tus proyectos, sobretodo si los subes a GitHub. 


## 4.7. GitHub para organizar tu proyecto 

GitHub te permite llevar un control de versiones, es decir, llevar un registro de los cambios que se realizan sobre un proyecto informático, particularmente sobre las modificaciones a los scripts.

Es muy buena idea llevar un control de versiones de tus scrips en tu carpeta `bin`.
