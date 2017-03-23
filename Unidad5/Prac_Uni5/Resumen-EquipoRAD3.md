# Resumen-EquipoRAD3

**INTEGRANTES:**

* **Veronica Gonzalez**

* **Arturo Morales**

* **Gissella Pineda**

* **Fernando Mar**

#**Preguntas**

**1.** Principales variantes del metodo, cuando es mas util cada una:

* **RADseq:** cuando necesitas mayor numero de loci. De la familia es la mejor opción para hacer *ensamblado de novo*. Util para genomas completos
* **2bRAD:** es util para ensamblados con *genoma de referencia*. No es util para genomas completos
* **GBS**: Es útil cuando no necesitas un gran número de loci, tiene una utilidad moderada para *ensambles de novo*
* **ddRAD**: Puedes escoger el tamaño de fragmento. Mayor cobertura.
* **ezRAD**: Util para genomas completos. Usa un kit específico
* **RADcap**: para obtener información de loci más específicos en una mayor cantidad

**2.**Limitantes y fuentes de error puede presentar este metodo (Laboratorio o bioinformatica). Que se puede hacer para amortiguar.

Las principales fuentes error son:

* **Alelos dropout (Abandonados) y alelos nulos:** los alelos dropout se presetan cuando ocurre un polimorfismo en la secuencia de reconocimiento de la enzima de restricción, generando alelos nulos, lo que conlleva a que no se secuencie ese fragmento; esto puede ocasionar que se considere homocigo un heterocigo.
Para amortiguar disminuir el tamaño del fragmento, usar enzimas tanto de corte común y de corte restrictivo. Hacer enriquecimiento de las enzimas por medio de sondas. Hacer filtros de calidad y Trimming

* **Duplicados de PCR y errores de genotipado:** agregar una tercera enzima que corta los dimeros o quimeras que se forman durante el PCR. Usar sondas específicas. Hacer filtros de calidad y trimming. 

* **Varianza en la profundidad de la cobertura entre loci:** se puede presentar durante la seleccion de tamaños del fragmento.  Cuando hay amplifucación preferenciasl de fragmentos basados en GC en los RAD que usan PCR.
Para confirmar que un polimorfismo presente en sitios de baja cobertura no es un error, se puede hacer una comparación entre individuos.

**3.** El muestreo requiere algun diseño especifico. Individuo ideal? Afecta el tejido, edad, condiciones, etc? muestreo

Depende de la pregunta de investigación, se reocmienda muestreo aleatorio que considere el rango de distribución de la especie y organismos silvestres.
La concentración de DNA es una variable importante pero puede ser diferente de acuerdo a la tecnica, desde el orden de 50-100 ng en RADseq hasta 1-2 microgramo en ezRAD.


**4.** Mencionar 2 software de analisis, pros y contras.

* **STACKS**: Es un software que permite hacer desde el preprocesamiento, mapeo, obtención de SNPs y anaisis de genetica de poblaciones. Son embargo se han encontrado fallas en el Demiltiplexing y se prefiere para comparacion entre individuos

* **PyRAD**: Permite hacer preprocesamiento y análisis de datos con mayor utilidad para analisis filogeneticos, debido a que es mas util en comparaciones entre especies.


