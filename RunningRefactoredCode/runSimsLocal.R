library(R.utils)
library(parallel)

# for runnning on server
# sourceDirectory("~/Pathways2019/RefactoredCode")
# source("~/Pathways2019/RunningRefactoredCode/createSimList.R")

# for running on my laptop
sourceDirectory("~/Research/Dordt18/Pathways2019/RefactoredCode")
source("~/Research/Dordt18/Pathways2019/RunningRefactoredCode/createSimList.R")

# Using mclapply to efficiently run all simulations on the parameters created by 
# createSimList, then combine into a dataframe and save dataframe of power 
# estimates only 


writePowerDFToFile <- function(filepath){
  results <- mclapply(simList,findPowerEstimate)
  #powerDF <- data.frame(matrix(unlist(results), nrow=8, ncol=5))
  # powerDF <- cbind(c(128, 64, 32,16,8,4,2,1), powerDF)
  # names(powerDF) <- c('numTests', 'fishers', 'minp', 'sumstat', 'sumsq', 'bonferroni')
  write.table(powerDF, file=filepath)
}


