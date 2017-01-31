#### Este script utiliza la función search_IndicadoresCountry() para correr la búsqueda para dos países, 
# guarda los resultados en una df  y la imprime en pantalla.

## required pckgs:
library(rscopus)
library(httr)

## Source function:
source("search_IndicadoresCountry.r")

# Set file to use
file="../data/indicadores.txt"

## Run

# for South Africa
SoutAf<-search_IndicadoresCountry(file=file, country='\"South Africa\"')

# for Peru
Peru<-search_IndicadoresCountry(file=file, country="Peru")

results<-rbind(SoutAf, Peru)
results
