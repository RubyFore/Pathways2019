calcBurdenTestStatOnTrueData <- function(phen, snpDat, setSize, numTests) {
  
  testStats <- numeric(length=numTests)
  
  for (i in 1:numTests) {
    if (i==1){
      indices <- seq(1, setSize[1],1)
      
    }else{
      indices <- seq(1, setSize[i],1) + sum(setSize[1:i-1])
    }
    # TODO:: this doesn't work when the case/control matrices have index one, 
    # as in when we are doing set sizes of one. Ok let's not do set sizes of one. 
    case <- snpDat[phen==1,indices]
    control <- snpDat[phen==0,indices]
    Fplus<- colMeans(case)/2
    Fminus <- colMeans(control)/2
    testStats[i] <- norm(Fplus, '2')-norm(Fminus, '2')
    
  }
  
  return(testStats)
}
