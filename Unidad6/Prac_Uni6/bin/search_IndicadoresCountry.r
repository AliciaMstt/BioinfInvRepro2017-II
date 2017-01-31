search_IndicadoresCountry<-function(file, country){
  library(rscopus)
  library(httr)
  
  # Definir Apikey para poder acceder a scopus (la generé desde http://dev.elsevier.com/myapikey.html, se requiere entrar desde bidiunam)
  api_key<-"b3d334ef41f4096efa745ee88fcc55ca"
  
  # Set argument variables:
  file=file # path to the file with the indicadores, must be tab delimited and do NOT have a header
  country=country # chr, desired country
  
  # create where to store results
  ndocs_tot<-numeric(0)

  # load indicadores file
  indicador<-read.delim(file, header=FALSE, quote="", stringsAsFactors=FALSE)  
  
  ## RUN query in loop
  for (i in 1:nrow(indicador)) {
    #build query
    query_string<-paste0('(TITLE-ABS-KEY(Maize)', ' AND TITLE-ABS-KEY(', country, ') AND TITLE-ABS-KEY(', indicador[i,1],'))')
    
    # run query
    # check out this for more filters than can be added to the query: http://api.elsevier.com/documentation/SCOPUSSearchAPI.wadl
    
    s = generic_elsevier_api(query = query_string,
      type = "search", search_type = "scopus",
      api_key = api_key)
    
    #extract number of resulted documents 
    res<-s$content$`search-results`$`opensearch:totalResults`
    
    # add to results 
    ndocs_tot<-rbind(ndocs_tot, c(country, indicador[i,1], as.numeric(res)))
  } 
  return(ndocs_tot)  
}


