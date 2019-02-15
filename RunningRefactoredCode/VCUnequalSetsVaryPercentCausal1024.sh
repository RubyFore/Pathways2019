#!/bin/bash
#SBATCH -J VCUnequalSetsVaryPercentCausal1024
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ruby_fore@alumni.brown.edu
date
echo ""
R --no-save > ~/Pathways2019/Simulations/OutputTxtFiles/VCUnequalSetsVaryPercentCausal1024.txt 2>&1 << EOF
source('~/Pathways2019/RunningRefactoredCode/runSimsBeaker.R')



# adjusting the percent causal in unequal set sizes, 1/8 vs 7/8

#define parameter frame
rr_var <- list(c(rep(1,896), rep(1.15, 128)), 
               c(rep(1.15,16), rep(1, 112),  rep(1,784),rep(1.15, 112)),
               c(rep(1.15, 32), rep(1,96), rep(1,800), rep(1.15, 96)), 
               c(rep(1.15,48), rep(1,80), rep(1,816), rep(1.15, 80)), 
               c(rep(1.15, 80), rep(1,48), rep(1,848), rep(1.15, 48)), 
               c(rep(1.15, 128), rep(1, 896)))
set_sizes <- list(c(128, 896))
n = 1000
maf = .05
perms = 1000
snps <- 1024

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
writePowerDFToFile('~/Pathways2019/Simulations/PowerDFs/VCUnequalSetsVaryPercentCausal1024RR1.15.RData')

EOF
