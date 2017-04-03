##Equipo meta- y barcoding "No sabemos, pero hacemos nuestro esfuerzo" 
**Integrantes:** Nancy Bárcenas, Gerardo Torres y Víctor Taracena

**1. ¿Cuáles son las principales variantes del método de laboratorio para generar mis datos y cuándo es más útil cada una?**
Las diferencias en la extracción de DNA para nuestras muestras depende del tejido y organismo que vayamos a trabajar; si se trabajará individuo por individuo o un conjunto (comunidades de bacterias). Actualmente existen diferentes kits de extracción que varían en cómo extraen el material genético para obtener una muestra de buena calidad que sirva para lo que necesitamos. 


**2. ¿Qué limitantes y posibles fuentes de error puede presentar este método (en el laboratorio o la bioinformática)? ¿Qué puede hacerse para amortiguarlos?**
- Contaminación por otro material genético (clorplasto de plantas, tejido del hospedero, de su alimento, etc)
- Secuencias de baja calidad
- Definición de los OTUS según el programa


**3. ¿El muestreo requiere algún diseño específico? Por ejemplo, si se quiere secuenciar un genoma de novo ¿qué individuo sería ideal? Si trabajo con trascriptomas, ¿cómo afecta el tejido, la edad, las condiciones, etc. mi muestreo?**
- Depende del objetivo del estudio; si se planea hacer filogenias, o conocer la diversidad de organismos de una zona, el muestreo tendrá que ser representativo y comparable en función de los objetivos planteados. 

El tejido o la muestra que se tome se hará de tal manera que se evite contaminación con material genético de otros organismos.
Por ejemplo: Si trabajas con comunidades de bacterias, la muestra puede contaminarse con bacterias de tus manos; también, depende del primer que se escoja, puedes tener contaminación con DNA de otros organismos con los que están asociadas las bacterias (e. g. el cloroplasto de las plantas). 
Otras fuentes de contaminación pueden ser por el alimento que consuma el organismo, por lo que el tejido se tiene que tomar de lugares donde es menos probable encontrar DNA ajeno. 

**4. Menciona al menos dos softwares principales que se utilicen para realizar la parte medular de los análisis bioinformáticos de este tipo de análisis (e.g. si es ensamblado de novo con qué se ensambla, no con qué se hace el pre-procesamiento) y cuáles son los pros y contras de cada uno.**
- Al tener secuencias de diferentes organismos, tanto en metabarcoding como barcoding, podemos comparar nuestras secuencias con bases de datos existentes y asignar una especie, o taxón, a cada una de nuestras secuencias. Existen diferentes métodos para este alineamiento; por similitud (como BLAST o BOLD), por métodos filogenéticos (el vecino más lejano o máxima verosimilitud), basados en caracteres o algoritmos de clasificación. 
Existen diferentes algoritmos o softwares que llevan a cabo el alineamiento por alguno de los métodos antes mencionados como BLAST, BOLD, TaxI, pplacer, Evolutionary Placement Algorithm, etc. Sin embargo, no existe un método que sea superior al resto. Varios meta análisis sobre los métodos de alineación suelen concluir que el mejor método de alineamiento está en función de la cantidad de secuencias, su largo, su calidad y la diversidad genética de la muestra. 


