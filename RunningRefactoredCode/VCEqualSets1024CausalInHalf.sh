#!/bin/bash
#SBATCH -J VCEqualSets1024CausalInHalf
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ruby.a.fore@gmail.com
date
echo ""
R --no-save > ~/Pathways2019/Simulations/OutputTxtFiles/VCEqualSets1024CausalInHalf.txt 2>&1 << EOF
source('~/Pathways2019/RunningRefactoredCode/runSimsBeaker.R')

# risk ratio or vector of risk ratios
rr_var <- list(c(rep(c(1,1,1,1.15), 128), rep(1,512)))
# list of vectors of set sizes
set_sizes <- list(rep(4, 256), rep(8, 128), rep(16,64), rep(32, 32), rep(64, 16), rep(128,8), rep(256,4), rep(512,2), (1024))
# cases + controls
n = 1000
# minor allele frequency, or vector of minor allele frequencies
maf = .05
# number of permutations
perms = 1000
# nubmer of SNVs
snps <- 1024
# type of stage 1 test
firstStageTest = 'VarianceComponents'

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
writePowerDFToFile('~/Pathways2019/Simulations/PowerDFs/VCEqualSets1024RR1.15CausalInHalf.RData')

EOF
