# Unidad 8 Análisis bioinformáticos usando Shell y R

## 8.1. Creación de “pipelines” para análisis de datos crudos a resultados 		

Una vez que tenemos listos los scripts de todos los pasos de un análisis es posible "enlazarlos" todos en un script "maestro" (**pipeline**) que los corra todos uno detrás de otro en el orden adecuado. 

Ventajas:

-  Prueba de que todo funciona y de que no dejamos scripts basura en el camino
-  Garantiza que los resultados finales son el resultado de los análisis que estamos documentando en nuestros scripts
-  Garantiza reproducibilidad de resultados

Desventajas:

- Utiliza tiempo de cómputo para correr


Recuerda el ejercicio 4 de la Unidad 3 para un ejemplo de cómo puede ser esto útil.

## 8.2 Correr R desde la Terminal

R es un programa que funciona con la línea de comando y por lo tanto puede correrse desde la terminal de varias formas:

### Acceder a la consola de R desde la Terminal: 

```{bash}
$ R
R version 3.2.2 (2015-08-14) -- "Fire Safety"
Copyright (C) 2015 The R Foundation for Statistical Computing
Platform: x86_64-apple-darwin13.4.0 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> 1+1
[1] 2
```
### Correr R en batch mode

Es decir correr scripts de R desde la terminal sin abrir R. Esto es útil porque correr un script de R puede volverse parte de un script de bash.

Existen tres formas de hacerlo:

#### `Rscript` 

Por ejemplo el script `/Practicas/Uni8/holascript_simple.R` contiene:

```{R}
x<-10
y<-6
cat("¡Hola mundo!", x, "+", y, "es igual a", x+y)
```

Y puede correrse así:

```
$ Rscript holascript_simple.R 
¡Hola mundo! 10 + 6 es igual a 16
```

#### `#!` a `Rscript`

El contenido de un script debe incluir en la primera línea `#!/usr/bin/Rscript`. Por ejemplo el script `/Practicas/Uni8/holascript.R` contiene:

```{R}
#! /usr/bin/Rscript

x<-10
y<-6
cat("¡Hola mundo!", x, "+", y, "es igual a", x+y)
```

Y puede correrse así:

```
$ ./holascript.R 
[1] "¡Hola mundo! 10 + 6 es igual a 16"
```

Nota: si lo anterior no funciona tal vez debas cambiar la ruta a Rscript, puedes averiguar esto con `which Rscript` en la Terminal. Ojo, esto NO es lo mismo que `which R`.

#### `R CMD BATCH`:

Una alternativa a RScript es `R CMD BATCH`. La diferencia es que el resultado de correr el script se escribe a un archivo `.Rout` (incluso si el script involucra imprimir resultados a pantalla con `cat` o `print`) que contiene el código, el resultado y datos de cuánto tardó el procesamiento. 

```
$ R CMD BATCH holascript_simple.R 
$ more holascript_simple.Rout

R version 3.2.2 (2015-08-14) -- "Fire Safety"
Copyright (C) 2015 The R Foundation for Statistical Computing
Platform: x86_64-apple-darwin13.4.0 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> x<-10
> y<-6
> cat("¡Hola mundo!", x, "+", y, "es igual a", x+y)
¡Hola mundo! 10 + 6 es igual a 16> 
> proc.time()
   user  system elapsed 
  0.230   0.034   0.242 

```

Notas recomendadas: [Running R in batch mode on Linux](http://www.cureffi.org/2014/01/15/running-r-batch-mode-linux/)


## Correr cualquier programa desde R

De forma similar, cualquier comando de bash (o programa que corra en bash) pude correrse desde R con la función `system()`. Por ejemplo el script `Unidad8/Prac_Uni8/bin/system_ejemplo.R` que contiene:


```
# obtener wd
system("pwd")

# enlistar archivos
system("ls")

# crear carpeta
system("mkdir Test")

# checar
system("ls")

# ver ayuda vcf
system("vcftools")

#escribir datos
x<-1:100
x
write(x, file="Test/x.txt")

# borrar carpeta
system("rm -r Test")

```

Puede correrse desde R e incluso guardarse en forma de notebook (knitr).
