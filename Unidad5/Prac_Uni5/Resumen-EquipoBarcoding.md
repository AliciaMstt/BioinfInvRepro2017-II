

## Equipo BARCODING.

**1**. ¿Cuáles son las principales variantes del método de laboratorio para generar mis datos y cuándo es más útil cada una?

+ **Grupo taxonómico** que se trabaja (bacterias, plantas, algas, hongos, animales- vertebrados, invertebrados).

![ ](https://github.com/andyrh0402/Tareas-Curso-BioinfInvRepro/blob/master/murcielago.jpeg) ![ ](https://github.com/andyrh0402/Tareas-Curso-BioinfInvRepro/blob/master/fullsizeoutput_4d.jpeg) ![ ](https://github.com/andyrh0402/Tareas-Curso-BioinfInvRepro/blob/master/molusco.png)  ![ ](https://github.com/andyrh0402/Tareas-Curso-BioinfInvRepro/blob/master/algas.jpeg)

+ **El método de extracción** (CTAB, Fenol) kits comerciales (Columnas, Perlas magnéticas).
+ **Primers.** El uso varía dependiendo de cada grupo.
+ **Condiciones de PCR**, de acuerdo con los primers y polimerasa que se utilice en cada caso.


**2**. ¿Qué limitantes y posibles fuentes de error puede presentar este método (en el laboratorio o la bioinformática)? ¿Qué puede hacerse para amortiguarlos?

+ La **cantidad de DNA** que se puede extraer de cada individuo y se puede utilizar para la obtención de secuencias, ya que la concentración final y calidad del DNA genómico afecta a las PCR.
+ Que los **primers** que utilizamos no sean los adecuados y se pierda información.
+ El **acceso a los programas** para hacer los analisis.
+ La **instalación** de los programas.
	

**3**. ¿El muestreo requiere algún diseño específico? Por ejemplo, si se quiere secuenciar un genoma de novo ¿qué individuo sería ideal? Si trabajo con trascriptomas, ¿cómo afecta el tejido, la edad, las condiciones, etc. mi muestreo?

+ **Ojetivos** de trabajo.
+ Número de **individuos requeridos**.
+ Si, dependiendo la **distribucion** de los individuos,(e. g.) en el caso de los parásitos la distribución depende del hospedero.
+ **Tamaño de los individuos**, pues de eso depende el tamaño del tejido disponible en la extracción de DNA.


	
**4**. Menciona al menos dos softwares principales que se utilicen para realizar la parte medular de los análisis bioinformáticos de este tipo de análisis (e.g. si es ensamblado de novo con qué se ensambla, no con qué se hace el pre-procesamiento) y cuáles son los pros y contras de cada uno.

	
Programa | Pros| Contras
--- | --- | ---
_**MESQUITE**_| Realiza análisis **filogenéticos** y algunos de **genética de poblaciones**.  | Los análisis disponibles dependen de los módulos instalados.
_**ARLEQUIN**_| Lleva a cabo el análisis de datos intra e inter poblacional.| El output es en línea. 
	
Desventajas de utilizar diversos softwares. Los formatos de input y output no es el mismo para todos ellos, incluso algunos se llevan a cabo en línea.
    
Para el alineamiento de las secuencias con el programa MEGA, se debe tener un buen criterio para la limpieza de datos, sin embargo existen programas como FASTQC que hace la **limpieza** de las secuencias de acuerdo a la calidad de los datos.

Una desventaja para programas como MR BAYES, STRUCTURE, etc. el **formato** del input se debe de cambiar, lo que puede ocasionar pérdida de datos.


**Andrea Rebollo, Raquel Hernández, Lisandro Hernández, Martín Cabrera.**