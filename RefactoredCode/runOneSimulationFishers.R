runOneSimulationFishers <- function(paramList){
  
  # deconstructing paramList to work with these functions. 
  paramList <- paramList[[1]]
  RR=paramList$RR[[1]]
  MAF=paramList$MAF
  n=paramList$n
  numSnp=paramList$numSnp
  numPerms=paramList$numPerms
  setSize=paramList$setSize[[1]]
  numTests=length(setSize)
  
  dataList <- simulateData(RR, MAF, n, numSnp) # first element is snp data, 2nd is phens
  perms <- permutePhenotypes(dataList[[2]], numPerms, n)
  
  # first element is Fs.control, 2nd is Fs.case
  MLElist <- findMLEofAlleleFreq(dataList[[1]], perms, numTests, numPerms)
  
  # Finding test statistics, for true data as well as permuted data 
  trueTestStat <- calcVCTestStatOnTrueData(dataList[[2]], dataList[[1]], setSize, numTests)
  testStats <- calculateStageOneVCTestOnPerms(MLElist[[1]], MLElist[[2]], numPerms, setSize, numTests)
  
  # Finding pvalues 
  truePvals <- calculatePvalOnTrueData(testStats, trueTestStat, numTests)
  permPvals <- calcPvalOnPerms(testStats, numPerms, numTests)
  
  # calculating significance of combined p-value
  return( findStage2PvalfromPvals(truePvals, permPvals, Fishers) )
}

