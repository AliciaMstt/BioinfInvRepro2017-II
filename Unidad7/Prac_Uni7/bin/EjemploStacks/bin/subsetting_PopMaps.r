rm(list = ls())

# Define WD and other directories
WD<-"../Jmonticola/PopSamples" 
setwd(WD) 
list.files()

### Identify samples with low coverage
  # Load cov mat info
  mcovinfo<-read.delim(file="docs/JmonJzOpt3_mcovinfo")
  ## see mean coverage per sample
  cbind(as.vector(mcovinfo$SampleSEQ.ID), mcovinfo$mean.cov)
  ## estimate mean coverage and sd
  mean(mcovinfo$mean.cov)
  sd(mcovinfo$mean.cov)
  ## filter samples with mean cov less than 23
  x<-mcovinfo$mean.cov<23
  lowcov<-as.vector(mcovinfo$SampleSEQ.ID)[x]
  lowcov

#### Generate Population Maps

##### Excluding outgroups 
  ## Create population map W/O OUT samples, EXCLUDING replicates
    x<-read.delim(file="data.out/JmonJzOpt3/JuJmonJzOpt3.SNP.SNPs_PopMap_norep.tsv", header=FALSE)
    # look for sample names that do not include Out
    s<-grep("Out", x[,1], invert= TRUE)
    # save those samples
    x<-x[s,]
    # Exclude low coverage samples
    y<-x$V1 %in% lowcov
    x<-x[!y,]
    #write file
    write.table(x, file="data.out/JmonJzOpt3/JuJmonJzOpt3.SNP.SNPs_PopMap_JmINGP_norep.tsv",
      sep = "\t",
      row.names =FALSE, col.names=FALSE,
      quote=FALSE)
  
  ## Create population map W/O OUTS samples, INCLUDING replicates
    x<-read.delim(file="/data.out/JmonJzOpt3/JuJmonJzOpt3.SNP.SNPs_PopMap_withrep.tsv", header=FALSE)
    # look for sample names that do not include Out
    s<-grep("Out", x[,1], invert= TRUE)
    # save those samples
    x<-x[s,]
    # Exclude low coverage samples
    y<-x$V1 %in% lowcov
    x<-x[!y,]
    #write file
    write.table(x, file= "data.out/JmonJzOpt3/JuJmonJzOpt3.SNP.SNPs_PopMap_JmINGP_withrep.tsv",
      sep = "\t",
      row.names =FALSE, col.names=FALSE,
      quote=FALSE)

##### All Samples including outgroups

## Create population map  EXCLUDING replicates
x<-read.delim(file="data.out/JmonJzOpt3/JuJmonJzOpt3.SNP.SNPs_PopMap_norep.tsv", header=FALSE)
# Exclude low coverage samples
y<-x$V1 %in% lowcov
x<-x[!y,]
#write file
write.table(x, file="data.out/JmonJzOpt3/JuJmonJzOpt3.SNP.SNPs_PopMap_JuAll_norep.tsv",
  sep = "\t",
  row.names =FALSE, col.names=FALSE,
  quote=FALSE)

# Create population map  INCLUDING replicates
x<-read.delim(file="/data.out/JmonJzOpt3/JuJmonJzOpt3.SNP.SNPs_PopMap_withrep.tsv", header=FALSE)
# Exclude low coverage samples
y<-x$V1 %in% lowcov
x<-x[!y,]
#write file
write.table(x, file="data.out/JmonJzOpt3/JuJmonJzOpt3.SNP.SNPs_PopMap_JuAll_withrep.tsv",
  sep = "\t",
  row.names =FALSE, col.names=FALSE,
  quote=FALSE)




