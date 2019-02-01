

library('slam')


# TO DO:: redo just using Matrix package, instead of slam package

findMLEofAlleleFreq<- function(snps, perms, numTests, numPerms){
  
  
  # This function accepts a matrix of SNPS (numSnp X n), a permutation matrix 
  # (n X numPerms), and the number of permutations desired, numPerms. 
  
  # It uses sparse arrays and matrix multiplication to find the first stage test 
  # statistics for the desired set sizes (set sizes must add to the total number 
  # of SNPS, numSNP) in a computationally efficient manner. 
  
  snps.case <- as.simple_triplet_matrix(t(snps)) # snps.case is now numSnp x n for multiplication purposes
  snps.control <-as.simple_triplet_matrix(t(snps))
  
  perms.case <- as.simple_triplet_matrix(perms) # perms is n x numPerms
  
  # To obtain snp counts for each individual that is a control (phenotype 0) we cannot 
  # multiply by the actual permuted phenotypes. We want a matrix that has 1s where 
  # the actual phenotype is 0, and 0 where the actual phenotype is 1. Subtracting
  # by one and then multiplying by -1 acheives this. 
  perms.control <- as.simple_triplet_matrix((perms-1)*-1)
  
  
  # Matrix multiplication to add SNPs by individual and ignore (turn to zeros)
  # the SNPs for individuals in the other category (case vs. control)
  snpCounts.case <- tcrossprod_simple_triplet_matrix(snps.case, t(perms.case))
  snpCounts.control <- tcrossprod_simple_triplet_matrix(snps.control, t(perms.control))
  
  
  
  # finding F+, F- for snp Sets (2/(2*n)=n for case/control)
  
  Fs.control <- snpCounts.control/n
  Fs.case <- snpCounts.case/n
  
  return (list(Fs.control, Fs.case))
  
}

