
n = 10^3
numSnp = 1028
RR = 1
MAF = 0.05
setSize = rep(1028/16, 16)
numPerms=10^4
numTests=length(setSize)

paramList <- list(n, numSnp, RR, MAF, setSize, numPerms)
names(paramList) <- c('n', 'numSnp', 'RR', 'MAF', 'setSize', 'numPerms')
