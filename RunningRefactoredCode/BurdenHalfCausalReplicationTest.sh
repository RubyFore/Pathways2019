#!/bin/bash
#SBATCH -J BurdenHalfCausalReplicationTest
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ruby_fore@alumni.brown.edu
date
echo ""
R --no-save > ~/Pathways2019/Simulations/OutputTxtFiles/BurdenHalfCausalReplicationTest.txt 2>&1 << EOF
source('~/Pathways2019/RunningRefactoredCode/runSimsBeaker.R')


#define parameter frame
rr_var <- list(c(rep(1,8), c(1.25, rep(1, 6), 1.25)))
#set_sizes <- list(c(rep(16, 16)), c(32, rep(16, 14)), c(64, rep(16, 12)), c(128, rep(16, 8)), c(256),)
set_sizes <- list(rep(2,128), rep(4, 64), rep(8, 32), rep(16,16), rep(32, 8), rep(64, 4), rep(128,2), c(256))
n = 1000
maf = .05
perms = 1000
snps <- 256


# type of stage 1 test
firstStageTest = 'Burden'

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
writePowerDFToFile('~/Pathways2019/Simulations/PowerDFs/BurdenHalfCausalReplicationTest.csv')

EOF

