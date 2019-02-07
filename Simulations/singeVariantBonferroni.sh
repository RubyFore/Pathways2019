#!/bin/bash
#SBATCH -J 1variantBonf
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ruby_fore@brown.edu
date
echo ""
R --no-save > ~/Pathways/CombinedP/CombinedSim/singleVariantBonferroni.txt 2>&1 << EOF
source("~/Pathways/oneStageSKAT.R")
#define parameter frame
rr_var <- list(c(rep(1,128), 1.75, rep(1,127)))
#set_sizes <- list(c(rep(16, 16)), c(32, rep(16, 14)), c(64, rep(16, 12)), c(128, rep(16, 8)), c(256),)
set_sizes <- list(rep(2,128), rep(4, 64), rep(8, 32), rep(16,16), rep(32, 8), rep(64, 4), rep(128,2), c(256))
agg_p_func <- list("fischer" = list("func" = function(x) {-2*sum(log(x))}), "minp" = list("func" = function(x){min(x)}))
agg_stat <- list("sumsq" = list("func" = function(x){sum(x^2)}), "sumstat" = list("func" =  function(x) {sum(x)}))
n = 1000
maf = .05
perms = 1000
snps <- 256

equalSSvariedRR <- expand.grid(rr_var, n, set_sizes,  snps, maf, perms, list(agg_stat), list(agg_p_func))
names(equalSSvariedRR) <- c("RR","n", "setSize", "numSnp", "MAF", "numPerms", "agg_stat", "agg_p")


equalSetSizeRR <- interface(equalSSvariedRR, 1000, 'singleVariantBonferroni')
save(equalSetSizeRR, file="/home/rfore/Pathways/CombinedP/CombinedSim/singleVariantBonf_errors.Rdata")


EOF
