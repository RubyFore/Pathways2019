

calculatePvalOnTrueData <- function(testStats, trueTestStats, numTests){
  
  truePvals <- vector("numeric", length=numTests)
  
  for (i in 1:numTests){
    truePvals[i] <- mean(c(testStats[i,], trueTestStats[[i]]) >= trueTestStats[[i]])
  }

  return (truePvals)  
}