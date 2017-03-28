#Resumen-Equipo_transcriptoma.md 
```
Equipo Transcriptoma

> Sebastián Arenas
> Estefania Cano
> Verónica Reyes
```

##**1. ¿Cuáles son las principales variantes del método de laboratorio para generar mis datos y cuándo es más útil cada una?**

![Transcriptoma](http://neurologiainba.com.ar/inba/wp-content/uploads/2015/07/transcriptoma.jpg "Transcripción") 


|| Paso | Variantes | Pros | Contras | 
| :--- |:--- |:--- |:--- |:--- | 
| Toma de muestras|RNA Later|El RNA se preserva al máximo y no tiene contacto con nada que lo pueda contaminar|El precio es muy elevado ||
 ||Nitrogeno liquido|Impide la descomposición y degradación del RNA|Se evapora fácil y es de dificil manejo en campo|||
  ||Hielo|Es el método más económico|Tiempo de duración menor||| 
  |Extracción RNA|TRIzol|Es la más económica. Se puede obtener DNA, RNA y proteínas| Se necesita un método extra de purificación||| 
  ||CTAB modificado|Es económico y se obtiene obtiene alta concentración de RNA|Se necesita un método extra de purificación||| 
  ||Cloroformo |Es económico y se obtiene altas concentraciones de RNA|Es peligroso y se necesita purificar||| ||Kit de Extracción con columnas|Se obtiene RNA purificado. Es práctico y rápido|El precio es alto. ||| 
  |Hibridación|microarreglos|Permite el analisis simultaneo de expresion de miles de genes. Sigue siendo de gran aplicación en diciplinas como la microbiología clínica, la medicina y para la identificación de especies como parásitos.|Requiere conocimiento previo de los transcritos para generar las sondas de interes. Utilizarlos introduce ruido por posibles hibridizaciones cruzadas, ademas de limitar el rango de detección a genes previamente descritos. Es muy laborioso||| 
  |Secuenciación|RNAseq|Permite secuenciamiento masivo de ADNc o ARN (Es altamente cuantitativa y de alto rendimiento, elimina ruido de hibridación, mayor rango de detección y panorama global de genes activados)|Algunas son de bajo rendimiento. Costos elevados.||| 
  ||qPCR|Altamente cuantitativo.Hace posible el desarrollo de perfiles de expresión génica de diferentes tipos de respuestas (i.e. la respuesta de defensa), además de modificaciones epigenéticas.|Es de alto costo|||


![](http://wp.patheos.com.s3.amazonaws.com/blogs/christianpiatt/files/2012/08/lab-accident.jpeg "Fail_in_lab")


##**2. ¿Qué limitantes y posibles fuentes de error puede presentar este método (en el laboratorio o la bioinformática)? ¿Qué puede hacerse para amortiguarlos?**

##Laboratorio

|Limitante|Fuente de Error|Solución|
|:---|:---|:---|
|Obtencion y calidad del RNA|Método de colecta|Muestrear con guantes, utilizar RNA later, manejar las muestras lo más frescas posibles|
|Tipo de organismo a utilizar |Carencia de información acerca del organismo|Se tratan de diferentes formas muestras animales, vegetales y bacterias|
||||
||||
|Rapidez, limpieza y orden|Procesamiento de la muestra|Adquirir destreza en la manipulación de los maneriales y los implementos de trabajo|
|No utilizar RNAzap y alcohol para mantener el lugar de trabajo limpio. Mezclarla con otras especies |Contaminación de tejidos|Axepcia absolutamente en todos los procesos y pasos de la extracción de RNA|
||Baja eficiencia de amplificación||
|Experiencia del tesista|Experiencia del tesista|Leer, preguntar y **tolerar la frustración**|

##Bioinformática


|Limitante|Fuente de Error|Solución|
|:---|:---|:---|
|Cantidad de lecturas |||reads, que varían desde 20 hasta 10,000,000 nucleótidos|Uso eficiente de recursos computacionales
|Almacenamiento de datos| |Conseguir servidores de 16 Gb o más y almacenamiento superior al tamaño de las librerías que nos permita el almacenaje y procesamiento adecuado|
||||
||||
||||
|Experiencia del tesista|Experiencia del tesista|Leer, preguntar, ir a cursos y **tolerar la frustración**|


##**3. ¿El muestreo requiere algún diseño específico? Por ejemplo, si se quiere secuenciar un genoma *de novo* ¿qué individuo sería ideal? Si trabajo con trascriptomas, ¿cómo afecta el tejido, la edad, las condiciones, etc. mi muestreo?**

Para ver diferencias en la expresion debemos considerar que los analisis de transcriptoma son los genes encendidos en el momento de la toma de la muestra, por lo tanto el tipo de tejido, la edad o condiciones ambientales influiran de manera directa en el transcriptoma. 

|Organismo|||
|:---|:---|:---|
|![Teporingo](http://planetatepoztlan.mx/wp-content/uploads/2016/04/conejo-teporingo-foto-google.jpg "Teporingo") |![Corazón](http://respuestas.tips/wp-content/uploads/2013/10/corazon...jpg "Corazón") |![Cerebro](http://www.clikisalud.net/adicciones/images/cerebro02.png "Cerebro")|
|![Oyamel](http://img.botanicayjardines.com/abies-religiosa-22/03-abies-religiosa-vista-superior-medium.jpg "Oyamel")|![genes_LEAFY](http://www.cell.com/cms/attachment/558351/4009570/gr2.jpg "genes_LEAFY")|![reistencia_en_plantas](https://projects.ncsu.edu/project/usda-ne-1013/Burkey.jpg "tolerancia_en_plantas")|



##**4. Menciona al menos dos softwares principales que se utilicen para realizar la parte medular de los análisis bioinformáticos de este tipo de análisis (e.g. si es ensamblado *de novo* con qué se ensambla, no con qué se hace el pre-procesamiento) y cuáles son los pros y contras de cada uno.**

|Software|Pros|Contras|
|:---|:---|:---|
|SOAPdenovo-Trans|Ensamblador de datos de transcriptoma|Requiere profundidad uniforme|
|Trans-ABySS|Realizar ensambles de novo de datos de RNA-Seq|Bajo desempeño en reconstrucción de transcritos de alta cobertura|
|Velvet/Oases|Realizar ensambles de novo del RNA-seq|Bajo desempeño en reconstrucción de transcritos de alta cobertura, Requiere mucha memoria|
|SeqMan NGen|Realizar un ensamble de secuencias de nueva generación, tiene la capacidad de montar cualquier genoma con rapidez y precisión||
|Trinity|Permite reconstruccion de transcrito, reconoce eventos de splicing alternativo y es especializado en analisis de muestras que no tienen genoma de referencia|Tiempo de ejecución muy largo|

![Logo_trinity](https://raw.githubusercontent.com/wiki/trinityrnaseq/trinityrnaseq/images/TrinityCompositeLogo.png "Logo_trinity")


```
Bibliografía

Ekblom R, Wolf JBW (2014) A field guide to whole-genome sequencing, assembly and annotation. Evolutionary Applications, 7, 1026–1042.

De Wit P, Pespeni MH, Ladner JT et al. (2012) The simple fool’s guide to population genomics via RNA-Seq: an introduction to high-throughput sequencing data analysis. Molecular Ecology Resources, 12, 1058–1067.

Baker M (2012) De novo genome assembly: what every biologist should know. Nature Methods, 9, 333–337


```
