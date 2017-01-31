# Required packages
library(rscopus)
library(httr)

# Definir Apikey para poder acceder a scopus (la generé desde http://dev.elsevier.com/myapikey.html, se requiere entrar desde bidiunam)
api_key<-"b3d334ef41f4096efa745ee88fcc55ca"


# read indicadores list
indicador<-read.delim("../data/indicadores.txt", header=FALSE, 
                       quote="", stringsAsFactors=FALSE)

## RUN

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
