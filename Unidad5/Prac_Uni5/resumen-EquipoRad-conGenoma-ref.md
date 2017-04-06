# 

###Integrantes:
Ofelia Jiménez Barron
Marisol De la Mora Curiel
Madisson Azucena Luna Bárcenas
Tania Garrido Garduño

#### ¿Cuáles son las principales variantes del método de laboratorio para generar mis datos y cuándo es más útil cada una?
| RADseq | GBS |
|-----------|--------|
| Enzimas de restricción| Enzimas de restricción| 
| Genomas largos | Genomas cortos |
|Ensamblados de novo **+** | Ensamblado de novo **+/-** |
| No patente| Con Patente |

#### ¿Qué limitantes y posibles fuentes de error puede presentar este método (en el laboratorio o la bioinformática)? ¿Qué puede hacerse para amortiguarlos?

#### Diseño esperimental

* Existencia de genomas de referencia **Seleccionar un buen genoma de referencia **
* Match con el genoma de referencia **Tomar en cuenta los parametrós con los cuales se secuenció el genoma de referencia para asegurar un buen Match**
* Producción de librrias **Tomar en cuenta si se mandan a hacer las librerias o se van a producir **

####Laboratorio
* Extracción (minimo 30 ng/microlitro) **Utilizar un buen kit de extracciń y corroborar concentracion y calidad con Kubit, NanoDrop y un Gel**
* Calidad del DNA (extra limpio) **Utilizar un buen kit de extracciń y corroborar concentracion y calidad con Kubit, NanoDrop y un Gel**

#### Bioinformática
* Elección de los parametros para la limpieza de secuencias **Hacer stadisticos de los datos**
* Elección de los softwares **En base a literatura relacionada** 
* Elección de parametros para el análisi de datos **Utilizando varios valores para los parametros con un mismo set de datos** 

#### ¿El muestreo requiere algún diseño específico? Por ejemplo, si se quiere secuenciar un genoma de novo ¿qué individuo sería ideal? Si trabajo con trascriptomas, ¿cómo afecta el tejido, la edad, las condiciones, etc. mi muestreo?

Muestreo: Depende del estudio (poblacional, filogenetico, filogeográfico etc.) la historia natural de la especie 
Individuo ideal para el mapeo: Seleccionar el genoma del grupo hermano o el más cercano existente

En trascriptomica: el tipo de muestra, la edad, las condiciones, afectan los patrones de exprosión 

#### Menciona al menos dos softwares principales que se utilicen para realizar la parte medular de los análisis bioinformáticos de este tipo de análisis (e.g. si es ensamblado de novo con qué se ensambla, no con qué se hace el pre-procesamiento) y cuáles son los pros y contras de cada uno.

Softwares para Mapeo
BOWTIE2
	Se basa en la calidad del elemento
	Lectura máxima: 4/1000 PB
	No permite indels 
	
BWA 
	Se basa en el conteo de No. de errores en la lectura/posición genómica
	Lectura máxima: 4/200 PB
	Permite indels consecutivos
