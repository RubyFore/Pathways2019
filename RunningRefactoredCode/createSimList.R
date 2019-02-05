

# risk ratio or vector of risk ratios
rr_var <- list(c(rep(1, 7), 1.25))
# list of vectors of set sizes
set_sizes <- list(rep(2, 128), rep(4, 64), rep(8, 32), rep(16,16), rep(32, 8), rep(64, 4), rep(128,2), c(256))
# cases + controls
n = 1000
# minor allele frequency, or vector of minor allele frequencies
maf = .05
# number of permutations
perms = 1000
# nubmer of SNVs
snps <- 256
# type of stage 1 test
firstStageTest = 'VarianceComponents'



# create the matrix 
equalSSvariedRR <- expand.grid(rr_var, n, set_sizes,  snps, maf, perms, firstStageTest) 
# name various columns appropriately 
names(equalSSvariedRR) <- c("RR","n", "setSize", "numSnp", "MAF", "numPerms", "firstStageTest")

equalSS.list <- split(equalSSvariedRR, seq(nrow(equalSSvariedRR)))

# now combining these lists with statistics

statistics <- c('fishers', 'minp', 'sumstat', 'sumsq', 'bonferroni')
simList.df <- expand.grid(equalSS.list, statistics, 10)
names(simList.df) <- c('paramList', 'statistic', 'numSims')

simList <- split(simList.df, seq(nrow(simList.df)))


