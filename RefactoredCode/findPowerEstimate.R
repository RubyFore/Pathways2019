findPowerEstimate <- function(simList){
  # options for statistic are 'fishers', 'sumstat', 'sumsq' or 'minp', all must 
  # be lower case
  
  # extracting data from the simList object passed in 
  
  paramList=simList$paramList
  statistic=simList$statistic
  numSims=simList$numSims
  if (statistic=='fishers'){
    
    pvals <- rep(NA, numSims)
    for (i in 1:numSims){
      pvals[i] <- runOneSimulationFishers(paramList)
    }
    
  }else if (statistic=='minp'){
    
    pvals <- rep(NA, numSims)
    for (i in 1:numSims){
      pvals[i] <- runOneSimulationMinP(paramList)
    }
    
  }else if (statistic=='sumstat'){
    
    pvals <- rep(NA, numSims)
    for (i in 1:numSims){
      pvals[i[]] <- runOneSimulationSumStat(paramList)
    }
    
  }else if (statistic=='sumsq'){
    
    pvals <- rep(NA, numSims)
    for (i in 1:numSims){
      pvals[i] <- runOneSimulationSumSq(paramList)
    }
    
  }
  
  return (mean(pvals < 0.05))
}