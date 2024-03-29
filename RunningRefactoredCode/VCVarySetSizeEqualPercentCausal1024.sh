#!/bin/bash
#SBATCH -J VCVarySetSizeEqualPercentCausal
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ruby.a.fore@gmail.com
date
echo ""
R --no-save > ~/Pathways2019/Simulations/OutputTxtFiles/VCVarySetSizeEqualPercentCausal.txt 2>&1 << EOF
source('~/Pathways2019/RunningRefactoredCode/runSimsBeaker.R')

# risk ratio or vector of risk ratios
rr_var <- list(c(rep(1, 7), 1.15))
# list of vectors of set sizes
set_sizes <- list(c(8,1016), c(16, 1008), c(32, 992), c(64, 960), c(128, 896), c(256, 768), c(512, 512))
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
writePowerDFToFile('~/Pathways2019/Simulations/PowerDFs/VCVarySetSizeEqualPercentCausal1024RR1.15.RData')

EOF
