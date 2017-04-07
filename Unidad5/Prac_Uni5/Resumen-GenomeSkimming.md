Nidia Mendoza Díaz

**1.** ¿Cuáles son las principales variantes del método de laboratorio para generar mis datos y cuándo es más útil cada una?
El método de *genome skimming* ensambla la fracción *high-copy* del genoma total, para obtener secuencias nucleotídicas de genomas de plástidos, rDNA y mtDNA. Este método fue desarrollado por Straub *et al.* (2012) para las lecturas producidas por una corrida de Illumina y, los trabajos que lo han empleado, utilizan esta tecnología de secuenciación.
Inicia con la obtención de ADN genómico a partir de hojas secadas en sílica-gel o de ejemplares herborizados, usualmente un protocolo CTAB. Usa los barcodes y sonicación para obtener los fragmentos. En general, los trabajos han seguido el preparar el ADN según los protocolos de Illumina. No hay mucha discrepancia en este punto.

**2.**¿Qué limitantes y posibles fuentes de error puede presentar este método? Qué hacer para amortiguarlos.
La calidad del ADN obtenido desde la extracción en laboratorio, que haga las lecturas precarias. Esto puede amortiguarse tratando de utilizar hojas secadas en sílice.  Sin embargo, el método de Ripma *et al.* (2014) no es conveniente para evolución molecular, pues se basa en ensamblar secuencias homólogas recuperables en todas las muestras, no en verificar el orden de ensamblaje de genes o confirmar secuencias y sus uniones. Para fines filogenéticos, esto no es un problema. 

**3.** ¿El muestreo requiere algún diseño específico? Por ejemplo, si se quiere secuenciar un genoma *de novo* ¿qué individuo sería ideal?
Para fines filogenéticos, Ripma *et al.* (2014) sugiere un método de ensamblaje *de novo* eficiente para generar una secuencia de referencia en organismos no modelo y, que no cuenten con referencias cercanas. Basado en ello, es aplicable a muestrear cualquier taxa para obtener su filogenia. 

**4.** Menciona al menos dos softwares principales que se utilicen para realizar la parte medular de los análisis bioinformáticos, pros y contras.
Hay varios métodos para ensamblar las lecturas provenientes de un *genome skim*:


+ El pipeline para alinear *reads* de Straub *et al.*(2011)
+ La línea de comando del ensamblador Velvet (Zerbino and Birney, 2008)
+ Scripts de Phyton desde el paquete OBI-Tools (Malé *et al.* 2014)
+ Trinity

**PROS.** Los anteriores son scripts y software libre.
**CONTRAS.** Requieren conocimiento bioinformático y el entendimiento de cada código. La inversión de tiempo en aprender a usar las herramientas de cada uno de los programas anteriores.

+ Geneious Pro

**PROS.** Permite comparar los diferentes scripts de ensamblaje, es interfaz gráfica lo cual, lo hace amigable para personas sin conocimiento bioinformático.
**CONTRAS.** No es software libre. El precio puede no ser asequible a cuaquier estudiante.
  
