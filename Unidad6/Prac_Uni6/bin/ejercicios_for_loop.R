### ejercicios  for loop

# Escribe un for loop para que divida 35 entre 1:10 e imprima el resultado en la consola.

for (i in 1:10) { 
  print(35/i)
}

# Modifica el loop anterior para que haga las divisiones solo para los números nones (con un comando, NO con `c(1,3,...)`)
for (i in 1:10) { 
  if (!i %% 2)
    next
  print(35/i)
}


# Modifica el loop anterior para que los resultados de correr todo el loop se guarden en una df de dos columnas, la primera debe tener el texto "resultado para x" (donde x es cada uno de los elementos del loop) y la segunda el resultado correspondiente a cada elemento del loop.
results<-numeric(0)
for (i in 1:10) { 
  if (!i %% 2)
    next
  results<-rbind(results, c(paste("resultado para",i), 35/i))
}
results<-as.data.frame(results)
colnames(results)<-c("parametro", "resultado")
results
