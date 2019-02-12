library(R.utils)
library(parallel)

# for runnning on server
sourceDirectory("~/Pathways2019/RefactoredCode")



# Using mclapply to efficiently run all simulations on the parameters created by 
# createSimList, then combine into a 
# plot and save the plot only


writePowerDFToFile <- function(filepath){
  results <- mclapply(simList, findPowerEstimate)
  # powerDF <- data.frame(matrix(unlist(results), nrow=8, ncol=5))
  # powerDF <- cbind(c(128, 64, 32,16,8,4,2,1), powerDF)
  # names(powerDF) <- c('numTests', 'fishers', 'minp', 'sumstat', 'sumsq', 'bonferroni')
  write.table(results, file=filepath)
}


