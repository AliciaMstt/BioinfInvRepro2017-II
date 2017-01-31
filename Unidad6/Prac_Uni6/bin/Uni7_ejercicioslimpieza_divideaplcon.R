#**Ejercicio** De manera similar a los ejemplos anteriores, 
utiliza la función `gather` para apilar las columnas correspondientes a 
sexo-edad en una nueva columna llamada "demo" y otra columna llamada "n" que contenga el número de casos confirmados.

tb_long <- gather(tb, demo, n, -iso2, -year, -id, na.rm = TRUE)
head(tb_long)


