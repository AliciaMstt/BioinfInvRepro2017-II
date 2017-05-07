#! /bin/sh
# This script subsets samples to exclude/include outgroups and low coverage samples, then runs the populations program of Stacks using a blacklist the putative paralogous loci and loci where sample size was n=1 in any given population 
#

## Create folder for outputs in 1stacks. This will be the WD. "FilteringBlacklist" referes to loci excluding the putative paralogous loci and loci where sample size was n=1 in any given population 

WD="../1stacks/stacks/JmonJzOpt3/Popsouts_Rselec/FilteringBlacklist"
mkdir -p $WD

#
## Prepare PopulationMap selected after the PopSamples_Evaluating_PostCleaning Rscript, using the following script:
R CMD BATCH ./subsetting_PopMaps.r

# Copy whitelists/blacklists to stacks WD
#
# For whitelists (previosly created by script 2.PopSamples_Whitelists-StacksPopulations.script)
cp ../data.out/JmonJzOpt3/*_whitelist.tsv $WD

# For blacklist (previosly created by script 4.PopSamples_generating_blacklist.r
cp ../data.out/JmonJzOpt3/*_blacklist.tsv $WD

#
# For the Population Map:
cp ../data.out/JmonJzOpt3/JuJmonJzOpt3.SNP.SNPs_PopMap_* $ST


##
########## Run populations Stacks program to export to Plink format
## 
#### Go to WD and create directories for output and variables
cd $WD
for x in "JmINGP" "JuAll"; do
mkdir -p $x
cd $x
mkdir -p out.replicates
mkdir -p out.noreplicates
#
# Create names of variables 
folder="../../../../JmonJzOpt3"
a=JuJmonJzOpt3 #will use it to create file names
whitext=".SNP.SNPs_whitelist.tsv"
blacktext=".SNP.SNPs_blacklist.tsv"


##### Run INCLUDING REPLICATES
# Delete .fst outs from previous runs
rm $folder/batch_1.fst*
#
# Run populations
populations -P $folder -M $folder/$a".SNP.SNPs_PopMap_"$x"_withrep.tsv" -b 1 -f p_value -p 10 --plink --structure --write_single_snp -W ../$a$whitext -B ../$a$blacktext
#
# Run plink to recode .ped to .raw plink file. This reads the plink.ped file and creates a plink.raw file in the WD
plink --file ../../../"batch_1.plink" --allow-no-sex --recodeA
#
# Have outputs in output folder to have them in a single place
mv ../../../batch_1.fst_summary* ./out.replicates
mv ../../../batch_1.plink* ./out.replicates
mv ../../../batch_1.populations* ./out.replicates
mv ../../../batch_1.sumstats* ./out.replicates
mv ../../../batch_1.structure.tsv ./out.replicates/
mv ./plink* ./out.replicates


##### Run EXCLUDING REPLICATES
# Delete .fst outs from previous runs
rm $folder/batch_1.fst*
#
# Run populations
populations -P $folder -M $folder/$a".SNP.SNPs_PopMap_"$x"_norep.tsv" -b 1 -f p_value -p 10 --plink --structure --write_single_snp -W ../$a$whitext -B ../$a$blacktext
#
# Run plink to recode .ped to .raw plink file. This reads the plink.ped file and creates a plink.raw file in the WD
plink --file ../../../"batch_1.plink" --allow-no-sex --recodeA
#
# Have outputs in output folder to have them in a single place
mv ../../../batch_1.fst_summary* ./out.noreplicates
mv ../../../batch_1.plink* ./out.noreplicates
mv ../../../batch_1.populations* ./out.noreplicates
mv ../../../batch_1.sumstats* ./out.noreplicates
mv ../../../batch_1.structure.tsv ./out.replicates/
mv ./plink* ./out.noreplicates

# go back one directory
cd ..
done
