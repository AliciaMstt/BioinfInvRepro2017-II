getwd()

# ver mi wd desde bash
system("pwd")

# enlistas archivos en wd
system("ls")

#hacer directorio
system("mkdir Test")

# ver ayuda vcf
system("vcftools --help")

#escribir datos a un archivo
x<-1:100
write(x,file="Test/x.txt")

# borrar carpeta test
system("rm -r Test")
