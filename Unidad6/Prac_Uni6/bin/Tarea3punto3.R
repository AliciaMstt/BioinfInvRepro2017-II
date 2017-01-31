# Ejercicios Tarea 7.3

library(dplyr)
library(tidyr)
library(magrittr)

# Cargar datos
fullmat<- read.delim(file="../meta/maizteocintle_SNP50k_meta_extended.txt")

# Transforma la Latitud y Longitud de los datos del formato de grados decimales a grados-minutos-segundos (deben seguir existiendo las mismas columnas, pero con formato en gradosminsec). Puedes apoyarte en el paquete "sp" para hacer la conversión

library("sp")
x<-as.character(dd2dms(fullmat$Latitud, NS=FALSE))
y<-as.character(dd2dms(fullmat$Longitud, NS=FALSE))
fullmat<-mutate(fullmat, Latitud=x, Longitud=y)


# Utiliza summarise para calcular la altura promedio a la que fue colectada cada raza (el resultado debe imprimirse en pantalla)
fullmat<-group_by(fullmat, Raza)
summarise(fullmat, mean(Altitud))


# Crear una nueva df de datos llamada subdf que tenga sólo las muestras de la raza Reventador, Jala y Ancho y sólo las columnas Raza, Latitud, Longitud y Altitud. La df final debe ir ordenada de MENOR a mayor Altitud.
subdf<-filter(fullmat, Raza %in% c("Reventador", "Jala", "Ancho")) %>%
       select(Raza, Latitud, Longitud, Altitud) %>%
       arrange(desc(Altitud))

## Copia el código de abajo para crear una df llamada germinacion con datos de el numero de plantas que producieron semillas que germinaron en diferentes porcentajes de germinacion
# Transforma esta df para que se vea como la df de la imagen.
germinacion<- data.frame(PorcenGer=c("<50", "50-100", ">100"), Reventador_PobA=c(2,3,4), Reventador_PobB=c(2,2,2), Jala_PobA=c(5,5,4), Ancho_PobA=c(3,4,5), Ancho_PobB=c(2,2,5), Ancho_PobC=c(3,1,3))

germinacion<-gather(germinacion, Raza, n, -PorcenGer) %>%
             separate(Raza, c("Raza", "Poblacion"), sep="_")
