# Soluciones ejercicios Uni5

## Solución ejercicio instalación FastX-Tools


`:/# cat README`

Partes relevantes del README:

```
Software Requirements
=====================

1. GCC is required to compile most tools.

2. FASTA-Clipping-Histogram tool requires Perl, the "PerlIO::gzip",
   "GD::Graph::bars" modules.
   
   Installing the perl modules can be accomplised by running:

   $ sudo cpan 'PerlIO::gzip'
   $ sudo cpan 'GD::Graph::bars'
   
3. FASTX-Barcode-Splitter requires the GNU Sed program.
   
4. FASTQ-Quality-Boxplot and FASTQ-Nucleotides-Distribution requires the
   'gnuplot' program.


Installation
============

To compile the tools, run:

  $ ./configure
  $ make
  
To install the tools, run (as root):

  $ sudo make install
```

Checar si tenemos GCC:

```
:/# gcc --version
bash: gcc: command not found
```

No está, por ende para instalarlo:

`:/# apt-get install gcc`
(dar `Y` de yes a lo que nos pida).

Checar si tenemos Perl:

```
:/# perl --version

This is perl 5, version 18, subversion 2 (v5.18.2) built for x86_64-linux-gnu-thread-multi
(with 44 registered patches, see perl -V for more detail)

Copyright 1987-2013, Larry Wall

Perl may be copied only under the terms of either the Artistic License or the
GNU General Public License, which may be found in the Perl 5 source kit.

Complete documentation for Perl, including FAQ lists, should be found on
this system using "man perl" or "perldoc perl".  If you have access to the
Internet, point your browser at http://www.perl.org/, the Perl Home Page.
```

Instalar los módulos que pide (y lo que los módulos piden):

```
:/# apt-get install zlib1g-dev
:/# apt-get install libgd2-xpm-dev
:/# cpan PerlIO::gzip
:/# cpan GD::Text
:/# cpan GD::Graph::bars
```




:/# cpan GD::Graph::bars
```

