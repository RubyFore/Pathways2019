calcPvalOnPerms <- function(testStats, numPerms, numTests){
  # this uses ranks to accomplish the goal quickly 
  
  # rank test statistics
  tstarRanks <- matrix(NA, ncol= numPerms, nrow=numTests)
  for (i in 1:numTests){
    tstarRanks[i,] <- rank(-testStats[i,])
  }
  
  
  # calculate empirical p-value for each test stat
  empiricalPvals <- tstarRanks/numPerms
  
  
  
  return (empiricalPvals) 
}