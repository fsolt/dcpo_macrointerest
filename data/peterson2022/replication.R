library(foreign)
library(Hmisc)


#Run the Extract.R file to create the Extract function.
#Extract was written by Jim Stimson and is available on his weebpage:  http://stimson.web.unc.edu/software/
source("Extract.R")

#
##make the figures.  Read in the files that are only the single series
ANES<-read.dta("ANES.dta")
gallup<-read.dta("gallup.dta")
psra<-read.dta("psra.dta")
roper<-read.dta("roper.dta")
psra2<-read.dta("psra2.dta")
gallup2<-read.dta("gallup2.dta")

par(mfrow=c(1,1))

# FIgure 1

plot(ANES$date2, ANES$index2,  xlab="" , ylab="", type="l", xlim=c(1973, 2014), ylim=c(50, 95),xaxt="n", lwd=3, col="blue")
axis(1, at=c(1973,1978,1983, 1988, 1993, 1998, 2003, 2008, 2013))     
title(ylab="Percent expressing interest in politics", #main="Figure 1. Aggregate interest in politics, ANES cumulative file", 
      cex.lab=1.2, xlab="Year")
minor.tick(nx=10)


#FIGURE 2

plot(psra$date2, psra$index2,xlab="" , ylab="", type="l", xlim=c(1973, 2014), ylim=c(50, 95),xaxt="n", lwd=3, col="darkgreen")
axis(1, at=c(1973,1978,1983, 1988, 1993, 1998, 2003, 2008, 2013))     
title(ylab="Percent expressing interest in politics", xlab="Year",  #main="Figure 2. Aggregate interest in politics, Pew surveys", 
      cex.lab=1.2,)
minor.tick(nx=10)

#FIGURE 3

plot(roper$date2, roper$index2,  xlab="" , ylab="", type="l", xlim=c(1972, 2012), ylim=c(50, 95),xaxt="n", lwd=3, , col="red")
axis(1, at=c(1973,1978,1983, 1988, 1993, 1998, 2003, 2008, 2013))     
title(ylab="Percent expressing interest in politics", #main="Figure 3. Aggregate interest in politics, Roper surveys", 
      xlab="Year", cex.lab=1.2)
minor.tick(nx=10)

#FIGURE 4
#plot the standardized lines on one graph
par(mfrow=c(1,1))

par(mar=c(5.1, 5.25, 4.1, 8.1), xpd=TRUE)

layout(rbind(1,2), heights=c(7,1))

plot(ANES$date2, scale(ANES$index2,center = TRUE, scale = TRUE), xlab="" , ylab="", type="l", xlim=c(1973, 2014), ylim=c(-3, 4),xaxt="n", lty=1, , lwd=2, col="blue")
axis(1, at=c(1973,1978,1983, 1988, 1993, 1998, 2003, 2008, 2013))     
lines(gallup$date2, scale(gallup$index2, center = TRUE, scale = TRUE), xlim=c(1973, 2012), lty=2, col="darkorchid", lwd=2)
lines(psra$date2, scale(psra$index2,center = TRUE, scale = TRUE), xlim=c(1973, 2012), lty=3, , lwd=2, col="darkgreen")
lines(roper$date2, scale(roper$index2, center = TRUE, scale = TRUE), xlim=c(1973, 2012), lty=4, col="red", lwd=2)
lines(psra2$date2, scale(psra2$index2, center = TRUE, scale = TRUE), xlim=c(1973, 2012), lty=5, lwd=2, col="orange3")
#lines(gallup2$date2, gallup2$index2, xlim=c(1973, 2012),)
title(ylab="Standardized percent expressing \ninterest in politics", #main="Figure 6. Aggregate interest in politics from five standardized surveys"
      , xlab="Year", cex.lab=1.2)
minor.tick(nx=10)

par(mar=c(0, 0, 0, 0))
# c(bottom, left, top, right)
plot.new()
legend('center','groups' ,inset=c(-0.2,0), c("ANES", "Gallup", "Pew 1", "Roper", "Pew 2"), lty=(1:5), col=c("blue", "darkorchid", "darkgreen", "red", "orange3"), ncol=3,bty ="n")




#TABLE 1: CREATE THE MACROINTEREST MEASURE. 
#load data
macroint2<-read.dta("calc2.dta")

#attach(macroint2)

#make the date variable in the right format
macroint2$date2<-ISOdate(macroint2$year,macroint2$month,1)

#Create the macrointerest measure

interestQ<-extract(macroint2$varname, as.Date(macroint2$date2), macroint2$index3, macroint2$ncases, unit="Q", begindt=ISOdate(1973,1,1),enddt=NA) 
summary(interestQ)
par(mfrow = c(1,1))
plot(interestQ)
display(interestQ)
#save as a text file
display(interestQ, "interestQ3.txt")


##PLOT WITH MACROINTEREST
par(mfrow=c(1,1))


par(mar=c(5.1, 5.25, 4.1, 8.1), xpd=TRUE)

layout(rbind(1,2), heights=c(7,1))

plot(ANES$date2, scale(ANES$index2,center = TRUE, scale = TRUE), xlab="" , ylab="", type="l", xlim=c(1973, 2014), ylim=c(-3, 4),xaxt="n", lty=1, , lwd=2, col="blue")
axis(1, at=c(1973,1978,1983, 1988, 1993, 1998, 2003, 2008, 2013))     
lines(gallup$date2, scale(gallup$index2, center = TRUE, scale = TRUE), xlim=c(1973, 2012), lty=2, col="darkorchid", lwd=2)
lines(psra$date2, scale(psra$index2,center = TRUE, scale = TRUE), xlim=c(1973, 2012), lty=3, , lwd=2, col="darkgreen")
lines(roper$date2, scale(roper$index2, center = TRUE, scale = TRUE), xlim=c(1973, 2012), lty=4, col="red", lwd=2)
lines(psra2$date2, scale(psra2$index2, center = TRUE, scale = TRUE), xlim=c(1973, 2012), lty=5, lwd=2, col="orange3")
lines(interestQ$period, scale(interestQ$latent, center = TRUE, scale = TRUE), lwd=3)
#lines(gallup2$date2, gallup2$index2, xlim=c(1973, 2012),)
title(ylab="Standardized percent expressing \ninterest in politics", #main="Figure 6. Aggregate interest in politics from five standardized surveys"
      , xlab="Year", cex.lab=1.2)
minor.tick(nx=10)

par(mar=c(0, 0, 0, 0))
# c(bottom, left, top, right)
plot.new()
#legend('center','groups' ,inset=c(-0.2,0), c("ANES", "Gallup", "Pew 1", "Roper", "Pew 2"), lty=(1:5), col=c("blue", "darkorchid", "darkgreen", "red", "orange3"), ncol=3,bty ="n")
legend('center','groups' ,inset=c(-0.2,0), c("ANES", "Gallup", "Pew 1", "Roper", "Pew 2", "Macrointerest"), lty=c(1,2,3,4,5,1), col=c("blue", "darkorchid", "darkgreen", "red", "orange3", "black"), ncol=3,bty ="n", lwd=c(2,2,2,2,2,3))


par(mfrow = c(1,1))
##bootstrap
set.seed(96345)
n.boot<-1000  #number of iterations
boot.est<-matrix(NA, nrow=168, ncol=n.boot) #create the empty matrix that the results will go in.  nrow is the number of final time points

for(i in 1:n.boot){
  #make the new "index" which is the input to the calc algorithm.  This is a draw from a random normal with mean and sd based on real results
  macroint2$index4<-rnorm(349 , mean = macroint2$index3, sd= sqrt( ((macroint2$ncases*macroint2$index)*(1-macroint2$index)^2+(macroint2$ncases*(1-macroint2$index))*(0-macroint2$index)^2)/(macroint2$ncases-1))  )
  #run calc.  Save the outout as "object"
  object<-extract(macroint2$varname, as.Date(macroint2$date2), macroint2$index4, macroint2$ncases, unit="Q", begindt=ISOdate(1973,1,1),enddt=NA)
  #add the measure of the macrointerest measure to the appropriate col of the boot.est     
  boot.est[,i]<-object$latent1
  #read in the data with the surveys by house
}

##pull out the mean and sd of bootstrapped results
MI.est<-matrix(NA, nrow=168, ncol=4) #create the empty matrix that the results will go in.  nrow is the number of final time points
MI.est[,1]<-interestQ$period
MI.est[,2]<-interestQ$latent1
MI.est[,3] <- apply(boot.est, 1, mean)
MI.est[,4] <- apply(boot.est, 1, sd)

#output to be added to stata file.
write.csv(MI.est, "Bootout.csv")
MI<-as.data.frame(MI.est)
#merge the data with the independent variables
#load the IV'
macrointerest<-read.dta("MI_IV.dta")

#add the macrointerest series

macrointerest$interest<-MI$V2
macrointerest$interest_BS<-MI$V3
macrointerest$interest_SE<-MI$V4

#reset the margins
par(mar=c(5.1, 4.1, 4.1, 2.1), xpd=TRUE)

##Figure 6
MI<-ts((macrointerest$interest), frequency=4, start=c(1973,1))
ICS<-ts((macrointerest$ics), frequency=4, start=c(1973,1))
PRAPP<-ts((macrointerest$prapp), frequency=4, start=c(1973,1))
TRUST<-ts((macrointerest$trust), frequency=4, start=c(1973,1))
##create the confidence interval as the interest measure +- 2* the bootstrap se.
MIpos<-ts((macrointerest$interest+2*macrointerest$interest_SE), frequency=4, start=c(1973,1))
MIneg<-ts((macrointerest$interest-2*macrointerest$interest_SE), frequency=4, start=c(1973,1))

##plot Macrointerest
count<-read.csv("counts.csv")

count$date2<-count$year+count$quarter*.1


par(mfrow=c(1,1))

par(mar=c(5, 4, 4, 6) + 0.1)
plot(MI, xlab="" , ylab="", type="l", ylim=c(60, 90),xaxt="n", lty=1, lwd=3)
axis(1, at=c(1973,1978,1983, 1988, 1993, 1998, 2003, 2008, 2013))     
title(ylab="Macrointerest", #main="Figure 8. Macrointerest",
      cex.lab=1.2, xlab="Year")
minor.tick(nx=10)
##add the standard errors
lines(MIpos, lty=2, col="black", lwd=1)
lines(MIneg, lty=2, col="black", lwd=1)

par(new=TRUE)

plot(count$date2, count$index3,  type="l",axes = FALSE, bty = "n", xlab = "", ylab = "", ylim=c(0,70), lty=3)
axis(side=4, at = c(0,2,4,6,8))   
mtext("Number of Surveys per Quarter", side=4, line=3)


##make the figure of bivariate relationships

#Subtract off the means
MI2<-ts((macrointerest$interest-72.68), frequency=4, start=c(1973,1))

ICS2<-ts((macrointerest$ics-84.17), frequency=4, start=c(1973,1))
PRAPP2<-ts((macrointerest$prapp-56.09), frequency=4, start=c(1973,1))
TRUST2<-ts((macrointerest$trust-35.55), frequency=4, start=c(1973,1))


#Divide by standard error
MI3<-ts((macrointerest$interest-72.68)/3.17, frequency=4, start=c(1973,1))

ICS3<-ts((macrointerest$ics-84.17)/12.66, frequency=4, start=c(1973,1))
PRAPP3<-ts((macrointerest$prapp-56.09)/12.97, frequency=4, start=c(1973,1))
TRUST3<-ts((macrointerest$trust-35.55)/3.93, frequency=4, start=c(1973,1))

#make plots

par(mfrow=c(2,2))
plot(MI3, xlab="" , ylab="", type="l", ylim=c(-4, 4),xaxt="n", lty=1, lwd=3)
axis(1, at=c(1973,1978,1983, 1988, 1993, 1998, 2003, 2008, 2013))     
title(ylab="Macrointerest and Trust in Government", #main="Figure 8. Macrointerest",
      cex.lab=1.2, xlab="Year")
minor.tick(nx=10)
lines(TRUST3, lty=2, col="gray", lwd=2)

plot(MI3, xlab="" , ylab="", type="l", ylim=c(-4, 4),xaxt="n", lty=1, lwd=3)
axis(1, at=c(1973,1978,1983, 1988, 1993, 1998, 2003, 2008, 2013))     
title(ylab="Macrointerest and ICS", #main="Figure 8. Macrointerest",
      cex.lab=1.2, xlab="Year")
minor.tick(nx=10)
lines(ICS3, lty=2, col="gray", lwd=2)

plot(MI3, xlab="" , ylab="", type="l", ylim=c(-4, 4),xaxt="n", lty=1, lwd=3)
axis(1, at=c(1973,1978,1983, 1988, 1993, 1998, 2003, 2008, 2013))     
title(ylab="Macrointerest and Pres. Approval", #main="Figure 8. Macrointerest",
      cex.lab=1.2, xlab="Year")
minor.tick(nx=10)
lines(PRAPP3, lty=2, col="gray", lwd=2)


##export the data to Stata to run the models
write.dta(macrointerest, "macrointerest_R.dta") 

