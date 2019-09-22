mdf <- read.csv("http://samplecsvs.s3.amazonaws.com/Sacramentorealestatetransactions.csv",TRUE,",")
class(mdf)                
head(mdf)
# Plot column 5 and 6
matplot(x= mdf[,5], y= as.matrix(mdf[,6]), type='l', pch=1, 
        col= 2:5, xlab='# of Beds', ylab = '# of Baths')
legend("bottomright", inset=.05, legend=c("V2", "V3", "V4", "V5"), 
       pch=1, col= 2:5, horiz=TRUE)
hist(mdf[,5], breaks=4)
plot(mdf[,5],mdf[,6],type='b', pch=16, col='green')#col='#00CCFF'
