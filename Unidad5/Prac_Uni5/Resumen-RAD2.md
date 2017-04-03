#Resumen_3RADseq
#####Martinez Gonzalez Carmina, Moreno Contreras Israel

1. ¿Cuáles son las principales variantes del método de laboratorio para generar mis datos y cuándo es más útil cada una?

Dos grandes tipos de variantes:

**Enzima de restricción simple**, digiere el DNA genómico con una sola enzima de restricción, seguido de un corte mecánico para reducir  fragmentos a una longitud adecuada para la secuenciación.

**Doble enzima:** para esta variedad existen 4 subvariedades

**Genotipificación por secuenciación**   
*GBS*, puede hacerse a través de cortes con una enzima de restricción común, y usando PCR para amplificar  fragmentos cortos.
SBG, mediante una enzima específica realiza los cortes DNA, y usando PCR para amplificar  fragmentos cortos .

**Digestión simple**
Selecciona de manera directa el tamaño de las secuencias al seleccionar las librerías que son únicas para la enzima de corte común.	

**Doble enzima** 
Selección indirecta  del tamaño de las secuencias al reducir  la complejidad de secuencias polimórficas usando dos enzimas y una librería ya preparada.
Selección directa del tamaño al utilizar dos enzimas de restricción con adaptadores específicos para cada enzima, y seleccionando el tamaño mediante el uso de geles. 

2.¿Qué limitantes y posibles fuentes de error puede presentar este método (en el laboratorio o la bioinformática)? ¿Qué puede hacerse para amortiguarlos?
Existen varios sesgos en la técnica. El primero de ellos es la presencia de alelos nulos que se manifiestan cuando un polimorfismo ocurre en un sitio de reconocimiento para una enzima de restricción, resultando en un fallo en el corte de DNA en esa posición. 
El segundo error es duplicado del PCR y errores de genotipificación, este tipo de error se genera durante la generación del PCR por procesos estocásticos que pueden causar que un alelo amplifique más que otros para un locus en una sola muestra, enmascarando a un heterocigoto como homocigoto. 
El tercero es la diferencia en la profundidad de cobertura entre loci, es la amplificación preferencias de fragmentos basados en guanina y citosina durante el PCR, o la preferencia en aplificación de fragmentos cortos sobre los largos. 

3.¿El muestreo requiere algún diseño específico? Por ejemplo, si se quiere secuenciar un genoma de novo ¿qué individuo sería ideal? 
En general depende de la pregunta de investigacion, pero algo que se debe considerar siempre es tener un muestreo representativo de la especie o las especies con las que se desea trabajar, conociendo la cercania filogenetica entre ellos para poder estandarizar las tecnicas de laboratorio

4.Menciona al menos dos softwares principales que se utilicen para realizar la parte medular de los análisis bioinformáticos de este tipo de análisis (e.g. si es ensamblado de novo con qué se ensambla, no con qué se hace el pre-procesamiento) y cuáles son los pros y contras de cada uno.
Análisis de secuencias y control de calidad con **pyRAD** (Eaton, 2014).
Fucniona mejor para filogenias 

Análisis de secuencias y control de calidad con **STACKS 2.1** (Catcher et al. 2011)
Funciona mejor para analisis de genetica de poblaciones

Para evaluar los niveles de endogamia y cuellos de botella con **SPAGeDi 1.3** (Hardy y Vekemans, 2002).
Analisa cualquier tipo de dato genotipico sim importar su ploidia