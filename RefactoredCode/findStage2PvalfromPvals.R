findStage2PvalfromPvals <- function(truePvals, empiricalPvals, aggregatingFunction){
  
  # empiricalPvals has dimensions numTests X numPerms
  # we're evaluating for each permutation, then comparing the truePvals to 
  # the null distribution generated from the permutations
  
  nullSk <- apply(empiricalPvals, 2, aggregatingFunction)
  trueStage2Pval <- aggregatingFunction(truePvals)
  if (as.character(substitute(aggregatingFunction)) == 'Fishers'){
    finalPval <- mean(c(nullSk, trueStage2Pval) >= trueStage2Pval)
  }else if (as.character(substitute(aggregatingFunction)) == 'min'){
    finalPval <- mean(c(nullSk, trueStage2Pval) <= trueStage2Pval)
  }
 
  
  return (finalPval)
  
  
}