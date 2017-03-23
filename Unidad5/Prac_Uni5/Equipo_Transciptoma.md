#Resumen-Equipo_transcriptoma.md 

**1. ¿Cuáles son las principales variantes del método de laboratorio para generar mis datos y cuándo es más útil cada una?**

*Toma de muestras*
Tejido de la etracción de RNA

*Extracción de RNA*

Cloroformo (dificil manejo)
CTAB modificado
TRizol
Kit de Extracción con columnas (mayor pureza menor cantidad).

*Hibridación*
Requiere conocimiento previo de los transcritos para generar las sondas de interes. Utilizarlos introduce ruido por posibles hibridizaciones cruzadas, ademas de limitar el rango de detección a genes previamente descritos.

microarreglos: permite el analisis simultaneo de expresion de miles de genes 

*Secuenciación*
Algunas son de bajo rendimiento. Costos elevados.

RNAseq:permite secuenciamiento masivo de ADNc o ARN (Es altamente cuantitativa y de alto rendimiento, elimina ruido de hibridación, mayor rango de detección y panorama global de genes activados))
qPCR: altamente cuantitativo, genera pequeños transcritos


![Resumen-Equipo_transcriptoma-FigN](Imagenes/transcriptoma.png) 

**2. ¿Qué limitantes y posibles fuentes de error puede presentar este método (en el laboratorio o la bioinformática)? ¿Qué puede hacerse para amortiguarlos?**

##Laboratorio

*Limitantes*

1. Método de colecta y procesamiento de la muestra

2. Calidad y obtencion de RNA

3. Tipo de organismo a utilizar  

3. Experiencia del tesista

*Fuentes de error*

1. Contaminación de tejidos

2. Baja eficiencia de amplificaión




##Bioinformática

*Limitantes*

1. Volumen de lecturas 

2. Almacenamiento de datos (Requiere servidores de 16 Gb o más y almacenamiento superior al tamaño de las librerías).

 
*Fuentes de error*

**

Apoyarse mediante un cluster o un equipo computacional que nos permita el almacenaje y procesamiento adecuado

**3. ¿El muestreo requiere algún diseño específico? Por ejemplo, si se quiere secuenciar un genoma de novo ¿qué individuo sería ideal? Si trabajo con trascriptomas, ¿cómo afecta el tejido, la edad, las condiciones, etc. mi muestreo?**

Si, porque para ver diferencias en la expresion debemos considerar que los analisis de transcriptoma son los genes encendidos en el momento de la toma de la muestra. 

![Resumen-Equipo_transcriptoma-Figconejo](Imagenes/conejo_1.png)

![Resumen-Equipo_transcriptoma-FigN](Imagenes/leafy.png) 


**4. Menciona al menos dos softwares principales que se utilicen para realizar la parte medular de los análisis bioinformáticos de este tipo de análisis (e.g. si es ensamblado de novo con qué se ensambla, no con qué se hace el pre-procesamiento) y cuáles son los pros y contras de cada uno.**

Genevestigator: Es base de datos de expresion de genes para metanalisis  de trasncriptomas.

Trinity: Permite reconstruccion de transcrito, reconoce eventos de splicing alternativo y es especializado en analisis de muestras que no tienen genoma de referencia)

SOAPdenovo-Trans: Ensamblador de datos de transcriptoma.( Requiere profundidad uniforme)

![Resumen-Equipo_transcriptoma-FigN](Imagenes/Trinity.png)
