

simulateData <- function(RR, MAF, n, numSnp){
  x.control = matrix(rbinom(numSnp*n/2,2, prob = MAF), nrow = n/2, ncol = numSnp, byrow=T)
  x.case = matrix(rbinom(numSnp*n/2,2, prob = RR*MAF), nrow = n/2, ncol = numSnp, byrow=T)
  
  # snp genotype matrix
  snps <- rbind(x.control, x.case)
  
  # phens = vector of binary phenotype
  phens <- c(rep(0, n/2), rep(1, n/2))

  return ( list(snps, phens) )
  
  
  }


