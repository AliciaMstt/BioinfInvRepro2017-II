### 
## Este script realiza búsquedas en scopus y cuenta el número de resultados obtenidos para cada indicador para México, Estados Unidos y Ecuador
# requiere un archivo con los términos de búsqueda deseados
# La construcción de la query_string es particular a cada búsqueda y se definió externamente

# Required packages
library(rscopus)
library(httr)

# Definir Apikey para poder acceder a scopus (la generé desde http://dev.elsevier.com/myapikey.html, se requiere entrar desde bidiunam)
api_key<-"b3d334ef41f4096efa745ee88fcc55ca"


# read indicadores list
indicador<-read.delim(paste0(getwd(),"/../data/indicadores.txt"), header=FALSE, quote="", stringsAsFactors=FALSE)


## RUN

#Create where to store results
ndocs_tot<-numeric(0)

for (pais in c("Mexico", '\"United States\"', "Ecuador")) {
    for (i in 1:nrow(indicador)) {
      #build query
      query_string<-paste0('(TITLE-ABS-KEY(Maize)', ' AND TITLE-ABS-KEY(', pais, ') AND TITLE-ABS-KEY(', indicador[i,1],'))')
      
      # run query
      # check out this for more filters than can be added to the query: http://api.elsevier.com/documentation/SCOPUSSearchAPI.wadl
      
      s = generic_elsevier_api(query = query_string,
        type = "search", search_type = "scopus",
        api_key = api_key)
      
      #extract number of resulted documents 
      res<-s$content$`search-results`$`opensearch:totalResults`
      
      # add to results 
      ndocs_tot<-rbind(ndocs_tot, c(pais, indicador[i,1], as.numeric(res)))
    } 
}


## Save results
# change to df
ndocs_tot<-as.data.frame(ndocs_tot) 

# add colnames
colnames(ndocs_tot)<-c("pais", "indicador", "n_results")

# save to file
write.table(ndocs_tot, file="../out/busquedaScopus.txt", quote=FALSE, sep="\t", row.names=FALSE)

