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
    
  } else if (statistic == 'bonferroni'){
    # This is a true/false value because we are really testing whether one or more 
    # tests has a significant pval when divided by numTests
    pvalSignificant <- rep(NA, numSims)
    for (i in 1:numSims){
      pvalSignificant[[i]] <- runOneSimulationBonferroni(paramList) 
    }
    
  }
  
  if (statistic != 'bonferroni'){
   powerEstimate <- mean(pvals < 0.05)
  } else if (statistic == 'bonferroni'){
    powerEstimate <- mean(pvalSignificant)
  }
  
  return ( powerEstimate )
}