

# risk ratio or vector of risk ratios
rr_var <- list(rep(1, 7), 1.25)
# list of vectors of set sizes
set_sizes <- list(rep(2,8), rep(4,4), rep(8,2))
# cases + controls
n = 10^3
# minor allele frequency, or vector of minor allele frequencies
maf = .05
# number of permutations
perms = 1000
# nubmer of SNVs
snps <- 256



# create the matrix 
equalSSvariedRR <- expand.grid(rr_var, n, set_sizes,  snps, maf, perms) 
# name various columns appropriately 
names(equalSSvariedRR) <- c("RR","n", "setSize", "numSnp", "MAF", "numPerms")

testEqualSS.list <- split(equalSSvariedRR, seq(nrow(equalSSvariedRR)))

# now combining these lists with statistics

statistics <- c('fishers', 'minp', 'sumstat', 'sumsq', 'bonferroni')
testSimList.df <- expand.grid(testEqualSS.list, statistics, 10)
names(testSimList.df) <- c('paramList', 'statistic', 'numSims')

SimList <- split(testSimList.df, seq(nrow(testSimList.df)))


