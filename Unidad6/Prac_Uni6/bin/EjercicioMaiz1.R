# Script para el ejercicio 1 (debe guardarse en /bin)

# checar cuál es mi wd. 
# Debe ser /bin, de no ser así cambiarlo en la consola, pero NO en el script. 
getwd()


# Cargar datos
fullmat<- read.delim(file= paste0(getwd(), "/../meta/maizteocintle_SNP50k_meta_extended.txt"))

# ¿Qué tipo de objeto creamos al cargar la base?
class(fullmat)

# ¿Cómo se ven las primeras 6 líneas del archivo?
head(fullmat)

# ¿Cuántas muestras hay?
nrow(fullmat)

# ¿De cuántos estados se tienen muestras?
length(levels(fullmat$Estado))

# ¿Cuántas muestras fueron colectadas antes de 1980?
sum(fullmat$A.o._de_colecta<1980, na.rm=TRUE)

# ¿Cuántas muestras hay de cada raza?
table(fullmat$Raza)

# En promedio ¿a qué altitud fueron colectadas las muestras?
mean(fullmat$Altitud)

# ¿y a qué altitud máxima y mínima fueron colectadas?
max(fullmat$Altitud)
min(fullmat$Altitud)

# Crear una nueva df de datos sólo con las muestras de la raza Olotillo
olotillomat<-fullmat[fullmat$Raza=="Olotillo", ]

# Crear una nueva df de datos sólo con las muestras de la raza Reventador, Jala y Ancho
x<-fullmat$Raza %in% c("Reventador", "Jala", "Ancho")
submat<-fullmat[x, ]

# escribe la matriz anterior a un archivo llamado "submat.csv" en /meta.
write.csv(submat, file= paste0(getwd(), "/../meta/submat.csv"))
