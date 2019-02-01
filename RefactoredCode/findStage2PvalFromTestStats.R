findStage2PvalFromTestStats <- function(trueTestStats, testStats, aggregatingFunction){
  
  #testStats is numTests x numPerms
  combinedTrueTestStat <- aggregatingFunction(trueTestStats)
  nullDist <- apply(testStats, 2, aggregatingFunction)
  finalPval <- mean(c(nullDist, combinedTrueTestStat) >= combinedTrueTestStat)
  return (finalPval)
  
  
  
}