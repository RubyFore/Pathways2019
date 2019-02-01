
permutePhenotypes <- function(phens, numPerms, n){
  
  # should validate that phens are of length n, with no NAs
  perms <- matrix(NA, nrow=n, ncol=numPerms)
  
  # performing permutations using sample with replace=F 
  for (i in 1:numPerms){
    perms[,i] <- sample(phens, n, replace=F)
    
  }
  
  return (perms)
  
}
