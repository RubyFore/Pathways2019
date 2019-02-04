
calculateStageOneBurdenTestOnPerms <- function(Fs.control, Fs.case, numPerms, setSize, numTests){
  # finding test stat using norm, subsetting for each test 
  testStats <- matrix(NA, ncol= numPerms, nrow=numTests)
  
  squaredFs.control <- Fs.control^2
  squaredFs.case <- Fs.case^2
  
  for (i in 1:numTests){
    # this funky indexing is to allow unequal set size, ie both vectors (2,2,2,2)
    # and (2,4,2) are valid input for setSize. 
    if(i==1){
      rowIndices <- seq(1, setSize[1],1)
    }else{
      rowIndices <- seq(1,setSize[i],1)+sum(setSize[1:i-1])
    }
    testFs.control <- Fs.control[rowIndices,]
    testFs.case <- Fs.case[rowIndices,]
    testStats[i,] <- sqrt(colSums(testFs.case^2)) - sqrt(colSums(testFs.control^2))
  }
  
  
  
  return(testStats)
}


