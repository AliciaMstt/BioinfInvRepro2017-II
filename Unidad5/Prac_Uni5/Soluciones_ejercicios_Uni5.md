## Soluciones ejercicios Uni 4



Formen equipos de 3 personas con un tipo de datos en común y que discutan entre sí con qué programas se analizan sus tipos de datos y si estos realizan también el pre-procesamiento. 

Ejemplo de soluciones:

* **Mapeo a genomas de referencia**:
Limpiar secuencias: FastX-Toolkit o Trimmomatic

Linearizacion y mapeo: STAR, SOAP-ALIGNER & SNPs, TopHat, SOAP2, Blat, SpliceMap

Ontologia de genes: Blast2GO. 

Análisis de expresion: ERANGE.

* **Transcriptomas/genomas de novo**: 

Limpiar secuencias: FastX-Toolkit o Trimmomatic
 
Ensamblaje: Trinity VELVET & OASES, Rnnotator, Cufflinks.

Ontologia de genes: Blast2GO. 

Análisis de expresion: ERANGE.

* **RAD/GBS para genética de poblaciones**: 
Limpiado de secuencias > pyRAD, Stacks, Trimmomatic
Ensamblado: Stacks (ustacks), pyRAD, Artemis (genoma referencia)
Alineamiento: Bowtie
Llamado de SNPs: pyRAD, GenomeStudio

* **RAD/GBS para filogenética**:
Demultiplexeo > Control calidad con pyRAD > Cluster de secuencias con usearch > Trimming/descartar mala calidad con pyRAD > alineamiento con Muscle > análisis filogenético

* **Metabarcoding**: Control de calidad, denoising, demultiplexing con Mothur > remover quimeras con UCHIME > Alineamiento con MACSE

* **Metagenoma bacterias**: Filtrado secuencias y calidad FastX-Toolkit o DynamicTrim > Agrupación lecturas con MG-RAST, MEGAN, PAER > Identificación procariontes con MG-RAST > Ensamble MetaVelvet > Anotación con MG-RAST

* **IonTorrent**:
Pre-procesamiento en equipo IonTorrent > secuencias fasta (no fastq) > análisis

* **UCES**: (sitios ultraconservados y lo que tienen al lado)
Demultiplexeo Illumina > Limpieza con Trimmomatic > Ensamblado con Trinity o LastZ (python) > Identificación contigs con Phyluce > Llamado SNPs con Phyluce > análisis filogenéticos, filogeográficos, etc 







