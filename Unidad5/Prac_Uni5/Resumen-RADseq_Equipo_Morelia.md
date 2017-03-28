### Integrantes del equipo RADseq de Morelia:
#####  Erandi Ramírez Aguirre, Guillermo Huerta Ramos.
#### 1. ¿Cuáles son las principales variantes del método de laboratorio para generar mis datos y cuándo es más útil cada una?
Las que secuencian fragmentos adyacentes a los sitios de corte de las enzimas de restricción: RADseq original y 2bRAD. El RAD seq original es bueno para ensambles de novo (permite ensamblar contigs largos), mientras que el 2bRAd es mejor cuando se tiene un genoma de referencia.

Las que secuencian fragmentos flanqueados por dos enzimas de restricción: todas requieren la selección previa del tamaño de los fragmentos, dependiendo de las enzimas de restricción seleccionadas.
a. las que usan una enzima de restricción y la selección de los fragmentos es indirecta: GBS, SBG. La técnica de GBS se utiliza para reducir el número de sitios polimórficos, por ejemplo en especies de importancia agrícola.

b. la que usan una enzima dos enzimas de restricción, es un protocolo para pirosecuenciación y es marca registrada: CRoPS. En general para usarse cuando hay muchos sitios polimórficos, se analizan especies de importancia agrícola.

c. las que usan una enzima de restricción, pero hay selección directa del tamaño del fragmento: MSG, ezRAD. Es mejor utilizarlos cuando hay un genoma de referencia.
#### 2. ¿Qué limitantes y posibles fuentes de error puede presentar este método (en el laboratorio o la bioinformática)? ¿Qué puede hacerse para amortiguarlos?
##### Problema: 
Tasa de error asociada al equipo de secuenciación masiva
##### Solución:
Análisis bioinformáticos que comparan los datos conocidos con un patrón general de error ya conocido para el equipo
#####  Problema:
Presencia de alelos polimorficos en los sitios de restricción y alelos nulos 
##### Solución:
 Se pueden filtrar mediante análisis bioinformáticos y añadir una medida de incertidumbre en análisis posteriores.
Duplicados de PCR y errores de genotipificación
#####  Problema:
 Durante el protocolo de de preparación de la biblioteca se pueden generar fragmentos genómicos en frecuencias diferenciales por azar lo que puede provocar una sobreestimación homocigocidad y replicación de secuencias con errores.
##### Solución: 
Los duplicados se pueden eliminar con análisis bioinformáticos. Hay algunas variantes de RAD que no requieren este paso
Variación en profundidad y cobertura entre loci
##### Problema: 
Puede existir una amplificación de fragmentos diferencial que altere la homogeneidad de lecturas (p. ej. en secuencias con alto contenido de GC)
Solución: Incrementar la profundidad promedio a través de la reducción del número de individuos incluidos por muestra


![Tipos de errores más comunes en el prodeco de obtención de datos Rad-SEq] (/home/ghuertaramos/Desktop/Resumen-RADseq_Equipo_Morelia.png)
######(Tomado de McCormack et al. 2013)

#### 3. ¿El muestreo requiere algún diseño específico? Por ejemplo, si se quiere secuenciar un genoma de novo ¿qué individuo sería ideal? Si trabajo con trascriptomas, ¿cómo afecta el tejido, la edad, las condiciones, etc. mi muestreo?

En la reconstrucción filogenética se recomienda que sea un grupo recientemente diversificado e inlcuit el mayor número d terminales posible.

El ADN debe tener una pureza y concentración mayores a la tradicional secuenciación. En general es un técnica flexible, que permite usar desde 0.05 a 1 ug de ADN. No da muy buenos resultados con muestras de ADN degradado o de menor calidad.

#### 4. Menciona al menos dos softwares principales que se utilicen para realizar la parte medular de los análisis bioinformáticos de este tipo de análisis (e.g. si es ensamblado de novo con qué se ensambla, no con qué se hace el pre-procesamiento) y cuáles son los pros y contras de cada uno.

Stacks, Pyrad, UNEAK.

Ventajas y desventajas

Stacks: con este software se puede hacer desde el pre-procesamiento, la genotipificación (también para ensambles de novo) y descriptores y estadísticos de genética de poblaciones y filogeografía (ventajas).

Pyrad: también se hace desde el pre-procesamiento de las secuencias, su genotipificación (para ensambles de novo). Puede manejar los indels y los puede leer como variación dentro de los alelos, por esto es mejor para análisis de filogéneticos de taxa por arriba de especie (ventajas).

UNEAK: está basado en la detección de SNP’s. Su desventaja es que no puede leer bien el corte y los parámetros de los loci de genomas de novo.

Diagrama de trabajo para la obtención de secuencias RAD con diferentes métodos 

#### Literatura consultada

Andrews, K. R., Good, J. M., Miller, M. R., Luikart, G., & Hohenlohe, P. A. (2016). Harnessing the power of RADseq for ecological and evolutionary genomics. Nat Rev Genet, advance on(2), 81–92. https://doi.org/10.1038/nrg.2015.28
DaCosta, J. M., & Sorenson, M. D. (2015). ddRAD-seq phylogenetics based on nucleotide, indel, and presence–absence polymorphisms: Analyses of two avian genera with contrasting histories. Molecular Phylogenetics and Evolution, (August). https://doi.org/10.1016/j.ympev.2015.07.026
Eaton, D. A. R. (2014). PyRAD: Assembly of de novo RADseq loci for phylogenetic analyses. Bioinformatics, 30(13), 1844–1849. https://doi.org/10.1093/bioinformatics/btu121
Eaton, D. A. R. (2013). Inferring Phylogeny and Introgression using RADseq Data : An Example from Flowering Plants ( Pedicularis : Orobanchaceae ), 62(5), 689–706. https://doi.org/10.5061/dryad.bn281
McCormack, J. E., Hird, S. M., Zellmer, A. J., Carstens, B. C., & Brumfield, R. T. (2013). Applications of next-generation sequencing to phylogeography and phylogenetics. Molecular Phylogenetics and Evolution, 66(2), 526–538. https://doi.org/10.1016/j.ympev.2011.12.007
Puritz et al. 2014. Demystifying the RAD fad. Molecular Ecology 23(24):5937-5942
Toonen, R. J., Puritz, J. B., Forsman, Z. H., Whitney, J. L., Fernandez-Silva, I., Andrews, K. R., & Bird, C. E. (2013). ezRAD: a simplified method for genomic genotyping in non-model organisms. PeerJ, 1, e203. https://doi.org/10.7717/peerj.203
