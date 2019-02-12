# code to unlist the list of simulation data saved. Must change nrow, depending 
# number of situations simulated 
powerDF <- data.frame(matrix(unlist(results), nrow=8, ncol=5))
powerDF <- cbind(c(128, 64, 32,16,8,4,2,1), powerDF)
names(powerDF) <- c('numTests', 'fishers', 'minp', 'sumstat', 'sumsq', 'bonferroni')

powerdf <- read.csv('~/Research/Dordt18/Pathways2019/Simulations/PowerDFs/VCUnequalSetsVaryPercentCausal1024.csv',
                    sep=' ')

powerdfcorrected <- data.frame(matrix(c(powerdf$fishers, powerdf$minp, powerdf$sumstat, powerdf$sumsq, powerdf$bonferroni)[1:30],nrow=6, ncol=5))
powerdfcorrected <- cbind(c(0, 0.125, 0.25, 0.375, 0.625, 1), powerdfcorrected)
names(powerdfcorrected) <-c('percentCausal', 'fishers', 'minp', 'sumstat', 'sumsq', 'bonferroni')



par(new=F)
plot(powerdfcorrected$percentCausal, powerdfcorrected$fishers, type='l', bty='n',lwd=5.5,col='red', ylab="", xaxt='n', yaxt='n',xlab="", ylim=c(0,1), las=1)
par(new=T)
plot(powerdfcorrected$percentCausal,powerdfcorrected$minp, type='l',bty='n', lwd=5.5,ylim=c(0,1),yaxt='n',col='blue', xaxt='n',ylab="",xlab="")
par(new=T)
plot(powerdfcorrected$percentCausal, powerdfcorrected$sumsq, bty='n', type='l',lwd=5.5, ylab="", yaxt='n',col='green', xaxt='n',xlab="", ylim=c(0,1))
par(new=T)
plot(powerdfcorrected$percentCausal, powerdfcorrected$sumstat, bty='n', type='l', lwd=5.5,ylab="", col='purple',yaxt='n',xaxt='n',xlab="", ylim=c(0,1))
par(new=T)
plot(powerdfcorrected$percentCausal, powerdfcorrected$bonferroni,bty='n', type='l', lwd=5.5,ylab="", col='yellow',yaxt='n',xaxt='n',xlab="", ylim=c(0,1))
par(new=T)


points(powerdf$fishers~powerdf$numTests, pch=6, cex=3, lwd=2.6)
axis(2, at=seq(0,1,0.2), lwd=1, las=1, cex.axis=1.9)
axis(1, at=2^(seq(0,7,1)), labels=c(1,2,4,8,16,32,64,128), lwd=1, cex.axis=1.9)
box(lwd=1)
points(powerdf$minp~powerdf$numTests, pch=5, cex=3, lwd=2.6)
points(powerdf$sumsq~powerdf$numTests, pch=0, cex=3, lwd=2.6)
points(powerdf$sumstat~powerdf$numTests, pch=2, cex=3, lwd=2.6)
# lty = 1,2,3,4,6

title("Power vs. Number of Tests \n 12.5% of SNPS causal", cex.main=2.3, xlab="Number of Tests, exponential scale", ylab="Power", cex.lab=2)
  legend("bottomleft", c("Fisher's", "SUMSQ", "SUMSTAT", "Min(P)"),
       pch= c(6,0,2,5,1), bty='n', cex= 2,pt.cex=2.5, pt.lwd=1.75)

  
par(new=F) 
  
  
  dev.off()
detach(powerRR1.25)
  
  
par(new=F)  
  powerdf2 <- read.csv('~/Research/Dordt18/Pathways2019/Simulations/PowerDFs/VCEqualSets1024.csv',
                       sep=' ') 
  plot(powerdf2$numTests, powerdf2$fishers, log="x", type='l', bty='n',lwd=5.5,col='red', ylab="", xaxt='n', yaxt='n',xlab="", ylim=c(0,1), las=1)
  par(new=T)
  plot(powerdf2$numTests,powerdf2$minp, log="x", type='l',bty='n', lwd=5.5,ylim=c(0,1),yaxt='n',col='blue', xaxt='n',ylab="",xlab="")
  par(new=T)
  plot(powerdf2$numTests, powerdf2$sumsq, log="x",bty='n', type='l',lwd=5.5, ylab="", yaxt='n',col='green', xaxt='n',xlab="", ylim=c(0,1))
  par(new=T)
  plot(powerdf2$numTests, powerdf2$sumstat, log="x",bty='n', type='l', lwd=5.5,ylab="", col='purple',yaxt='n',xaxt='n',xlab="", ylim=c(0,1))
  par(new=T)
  plot(powerdf2$numTests, powerdf2$bonferroni, log="x",bty='n', type='l', lwd=5.5,ylab="", col='yellow',yaxt='n',xaxt='n',xlab="", ylim=c(0,1))
  par(new=T)
  
  powerdfcorrected <- data.frame(matrix(c(powerdf2$fishers, powerdf2$minp, powerdf2$sumstat, powerdf2$sumsq, powerdf2$bonferroni),nrow=9, ncol=5))
  