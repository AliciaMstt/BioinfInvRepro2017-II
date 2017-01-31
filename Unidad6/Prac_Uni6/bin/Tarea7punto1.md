# Tarea 7.1


#### Ejercicio rscopus
Observa el siguiente código:

(para correr esto es necesario estar conectado a la red UNAM o tener una api key)

```
# Required packages
library(rscopus)
library(httr)

# Definir Apikey para poder acceder a scopus (la generé desde http://dev.elsevier.com/myapikey.html, se requiere entrar desde bidiunam)
api_key<-"b3d334ef41f4096efa745ee88fcc55ca"


# read indicadores list
indicador<-read.delim("../data/indicadores.txt", header=FALSE, 
                       quote="", stringsAsFactors=FALSE)

#### RUN

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

Con base en el código anterior, utiliza un loop para repetir la búsqueda para todos los indicadores del archivo `/data/indicadores.txt` (se encuentra en el repo de Practicas de la Uni7) y para tres países: México, United States y Ecuador. Los resultados deben guardarse en un una df única y escribirse a un archivo que esté en una carpeta `out` que se llame `busquedaScopus.txt`. 

Pega en el cuadro de texto de abajo el contenido de tu script. No olvides primero comprobar que funcione asumiendo que tu wd sea bin (es decir Practicas/Uni7/bin).

El resultado de este ejercicio está en el script [Ejercicio_rscopusloop.R](Ejercicio_rscopusloop.R)


#### Carga en una df llamada fullmat el archivo `meta/maizteocintle_SNP50k_meta_extended.txt` (el del ejercicio de maíces que vimos al principio de la Uni7. Responde lo siguiente y escribe el código que utilizarías para responder en promedio ¿a qué altitud fueron colectadas las muestras que fueron colectadas a una latitud menor a 20?

`mean(fullmat[fullmat$Latitud <20, 16], na.rm = TRUE)`

#### Crear una nueva df de datos sólo con las muestras de los estados Puebla, Jalisco, Yucatan. Tu db debe llamarse subdf.
```
x<-fullmat$Estado %in% c("Puebla", "Jalisco", "Yucatan")

subdf<-fullmat[x, ]
```

#### Cuenta con un comando cuántas muestras hay en subdf
`nrow(subdf)`

#### Corre el comando `summary(subdf$Altitud)` ¿Qué información obtienes? (NO copies y pegues el resutado, explica)
Summary nos brinda un resumen que inluye el valor mínimo, medio y máximo, así como el primer y tercer cuartil

#### Crea una nueva columna en subdf que sea la última columna y que contenga la altitud de cada muestra en cm (actualmente está en m). Lanueva columna debe llamarse AltitudCM

```
AltitudCM<-subdf$Altitud * 100
cbind(subdf, AltitudCM)

# o más fácil:
subdf$AltitudCM=subdf$Altitud*100
```

#### Utilizando la subdf crea una df x que contegna las columnas NSiembra, Raza y Altitud de las muestras de Puebla ordenadas de menor a mayor altitud.
```
x<-subdf[subdf$Estado=="Puebla", c(2,5,16)]
x<-x[order(x$Altitud), ]
x
```



