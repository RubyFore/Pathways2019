#!/bin/bash
#SBATCH -J VCUnequalSetsVaryPercentCausal
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ruby_fore@alumni.brown.edu
date
echo ""
R --no-save > ~/Pathways2019/Simulations/OutputTxtFiles/VCUnequalSetsVaryPercentCausal.txt 2>&1 << EOF
source('~/Pathways2019/RunningRefactoredCode/runSimsBeaker.R')



# adjusting the percent causal in unequal set sizes, 1/8 vs 7/8

#define parameter frame
rr_var <- list(c(rep(1,32), rep(1,192), rep(1.25,32)), 
               c(rep(1.25,4), rep(1, 28),  rep(1,196),rep(1.25, 28)),
               c(rep(1.25, 8), rep(1,24), rep(1,200), rep(1.25, 24)), 
               c(rep(1.25,12), rep(1,20), rep(1,204), rep(1.25, 20)), 
               c(rep(1.25, 20), rep(1,12), rep(1,212), rep(1.25, 12)), 
               c(rep(1.25, 32), rep(1, 224)))
set_sizes <- list(c(32, 224))
n = 1000
maf = .05
perms = 1000
snps <- 256

firstStageTest = "VarianceComponents"

# create the matrix 
equalSSvariedRR <- expand.grid(rr_var, n, set_sizes,  snps, maf, perms, firstStageTest) 
# name various columns appropriately 
names(equalSSvariedRR) <- c("RR","n", "setSize", "numSnp", "MAF", "numPerms", "firstStageTest")

equalSS.list <- split(equalSSvariedRR, seq(nrow(equalSSvariedRR)))

# now combining these lists with statistics
statistics <- c('fishers', 'minp', 'sumstat', 'sumsq', 'bonferroni')
simList.df <- expand.grid(equalSS.list, statistics, 10^3)
names(simList.df) <- c('paramList', 'statistic', 'numSims')

simList <- split(simList.df, seq(nrow(simList.df)))
writePowerDFToFile('~/Pathways2019/Simulations/PowerDFs/VCUnequalSetsVaryPercentCausal2.csv')

EOF
