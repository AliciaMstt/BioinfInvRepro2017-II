#! /bin/sh
# This script subsets samples to exclude/include outgroups and low coverage samples, then runs the populations program of Stacks using a blacklist the putative paralogous loci and loci where sample size was n=1 in any given population. This is performed independently for each of the Juniper populations, for min 4, 5, 6, 7, 8, 9 inds per population, as needed for the aSFS downstream analysis. 
#

## Create folder for outputs in 1stacks. This will be the WD.

WD="../1stacks/stacks/JmonJzOpt3/Popsouts_Rselec/FilteringBlacklist"
mkdir -p $WD

# Copy whitelists/blacklists and population maps to stacks WD
#
# For whitelists (previosly created by script 2.PopSamples_Whitelists-StacksPopulations.script)
cp ../data.out/JmonJzOpt3/*_whitelist.tsv $WD

# For blacklist (previosly created by script 4.PopSamples_generating_blacklist.r
cp ../data.out/JmonJzOpt3/*_blacklist.tsv $WD

#
# For the Population Map (edited from JuJmonJzOpt3.SNP.SNPs_PopMap_JmINGP_norep.tsv previsosly created by 5.PopSamples_Stackspopulations.script)
cp ../data.out/JmonJzOpt3/JuJmonJzOpt3.SNP.SNPs_PopMap_aSFS_* $ST


##
########## Run populations Stacks program to export to Plink format
## 
#### Go to WD and create directories for output and variables
cd $WD
for j in "4" "5" "6" "7" "8" "9"; do 
for x in "Aj" "Bl" "Ch" "Ci" "Co" "Iz" "Ma" "Ne" "Pe" "Pp" "Ta" "Tl" "To"; do
mkdir -p $x/$j
cd $x/$j
mkdir -p out.noreplicates
#
# Create names of variables 
folder="../../../../../JmonJzOpt3"
a=JuJmonJzOpt3 #will use it to create file names
whitext=".SNP.SNPs_whitelist.tsv"
blacktext=".SNP.SNPs_blacklist.tsv"


##### Run EXCLUDING REPLICATES
# Delete .fst outs from previous runs
rm $folder/batch_1.fst*
#
# count how many inds are in the pop (will be used for -r in populations)
tot=`wc -l < $folder/$a".SNP.SNPs_PopMap_aSFS_"$x".tsv"`
inds=`bc -l <<< $j/$tot`
# Run populations
populations -P $folder -M $folder/$a".SNP.SNPs_PopMap_aSFS_"$x".tsv" -r $inds -b 1 -f p_value -p 1 --plink --write_single_snp -W ../../$a$whitext -B ../../$a$blacktext
#
# Run plink to recode .ped to .raw plink file. This reads the plink.ped file and creates a plink.raw file in the WD
plink --file ../../../../"batch_1.plink" --allow-no-sex --recodeA
#
# Have outputs in output folder to have them in a single place
mv ../../../../batch_1.plink* ./out.noreplicates
mv ../../../../batch_1.populations* ./out.noreplicates
mv ../../../../batch_1.sumstats* ./out.noreplicates
mv ./plink* ./out.noreplicates

# go back to aSFS directory
cd ../..
done
done

######## Copy data to relevant places
# Copy this script as log to WD
cd $WD
cp ../../../../../2R/Jmonticola/PopSamples/bin/5.PopSamples_Stackspopulations.script ./

# Copy results to 2R folder:

cp -r ../aSFS ../../../../../2R/Jmonticola/PopSamples/data.out/JmonJzOpt3/

