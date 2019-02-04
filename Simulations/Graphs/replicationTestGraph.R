

powerdf <- read.csv('~/Research/Dordt18/Pathways2019/Simulations/PowerDFs/INCORRECTreplicationTest.csv',
                    sep=' ')


attach(powerdf)



par(new=F, mar=c(5.1, 5.1, 4.1, 2.1))
plot(numTests, fishers, log="x", type='l', bty='n',lwd=5.5,col='gray80', ylab="", xaxt='n', yaxt='n',xlab="", ylim=c(0,1), las=1)
par(new=T)
plot(numTests,minp, log="x", type='l',bty='n', lwd=5.5,ylim=c(0,1),yaxt='n',col='gray80', xaxt='n',add=T,ylab="",xlab="")
par(new=T)
plot(powerdf$numTests, powerdf$sumsq, log="x",bty='n', type='l',lwd=5.5, ylab="", yaxt='n',col='gray80', xaxt='n',xlab="", ylim=c(0,1))
par(new=T)
plot(powerdf$numTests, powerdf$sumstat, log="x",bty='n', type='l', lwd=5.5,ylab="", col='gray80',yaxt='n',xaxt='n',xlab="", ylim=c(0,1))
par(new=T)

points(fishers~numTests, pch=6, cex=3, lwd=2.6)
axis(2, at=seq(0,1,0.2), lwd=1, las=1, cex.axis=1.9)
axis(1, at=2^(seq(0,7,1)), labels=c(1,2,4,8,16,32,64,128), lwd=1, cex.axis=1.9)
box(lwd=1)
points(minp~numTests, pch=5, cex=3, lwd=2.6)
points(sumsq~numTests, pch=0, cex=3, lwd=2.6)
points(sumstat~numTests, pch=2, cex=3, lwd=2.6)
# lty = 1,2,3,4,6

title("Power vs. Number of Tests \n 12.5% of SNPS causal", cex.main=2.3, xlab="Number of Tests, exponential scale", ylab="Power", cex.lab=2)
  legend("bottomleft", c("Fisher's", "SUMSQ", "SUMSTAT", "Min(P)","Single Stage\nwith Bonferroni"),
       pch= c(6,0,2,5,1), bty='n', cex= 2,pt.cex=2.5, pt.lwd=1.75)
dev.off()
detach(powerRR1.25)