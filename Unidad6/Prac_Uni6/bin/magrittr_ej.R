# A partir de sólo con las muestras de los estados Puebla, Jalisco, Yucatan crea una df que contenga las columnas NSiembra, Raza y Altitud de las muestras de Puebla ordenadas de menor a mayor altitud.

library(magrittr)
fullmat<- read.delim("../meta/maizteocintle_SNP50k_meta_extended.txt")
x<-fullmat$Estado %in% c("Puebla", "Jalisco", "Chiapas") %>% 
  fullmat[., ] %>% 
  .[.$Estado=="Puebla", c(2,5,16)] %>%
  .[order(.$Altitud), ]
