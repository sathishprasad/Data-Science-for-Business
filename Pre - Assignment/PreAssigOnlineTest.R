#######
### R script for Online Test 
### (Reminder: make sure all the files and 
### scripts are in the working directory)
###
source("DataAnalyticsFunctions.R")
installpkg("lattice")
library(lattice)
installpkg("KernSmooth")
library(KernSmooth)

load("WorkspacePreAssigOnlineTest.RData")

##############################################

#1. Consider studying the actual amount of the loans. Which of the following commands provides a good summary of the amount of loans? 

#a)
mean(germancredit$amount)
#b)
median(germancredit$amount)
#c)
summary(germancredit$amount)
#d)  # note that "View" has the first line uppercase
View(germancredit)


##############################################
#2. Which of the following commands computes the mean of the loan amounts conditional on the duration of the loan to be larger than 1 year? 

#a)  
mean(germancredit$amount[germancredit$amount > 1] )
#b)	
mean(germancredit$amount[germancredit$duration > 12] )
#c)	
mean(germancredit$amount[germancredit$duration <= 12] )
#d)	
mean(germancredit$amount[germancredit$duration == 1] )

##############################################

#3. Which of the following commands yields a better visualization of the data regarding default rates (Default=1, No default=0) and credit history ("very poor", "poor", and "good").
#
#(a)
aggregate(Default ~ history, data=germancredit,FUN=mean)
#
#(b)
plot( aggregate(Default ~ history, data=germancredit,FUN=mean),   ylab="Default rate",xlab="Credit history")
#
#(c)
plot( factor(Default) ~ history, data=germancredit, col=c(8,2),  ylab="Default",xlab="Credit history")
#
#(d)
plot( germancredit$Default, germancredit$history, xlab="Default (0 or 1)", ylab = "Credit history")



##############################################

#4. Which of the following visualizations better communicate/display the relation between amount of loans and duration of loans in a presentation? 

#a)
par(mfrow=c(1,2))
hist(germancredit$amount, xlab="Amount (DB)",main="Loan Amounts")
hist(germancredit$duration, xlab="Duration (months)", main="Loan Duration")
par(mfrow=c(1,1))

#b)	
par(mfrow=c(1,2))
boxplot(germancredit$amount, ylab="Amount of Loan (DB)")
boxplot(germancredit$duration, ylab="Duration of Loan (months)")
par(mfrow=c(1,1))

#c)	
plot(germancredit$duration, germancredit$amount, xlab="Duration (months)", ylab="Amount (DB)")

#d)	
smoothScatter(germancredit$duration, germancredit$amount, xlab="Duration (months)", ylab="Amount (DB)")
lines(lowess(germancredit$duration, germancredit$amount),col="blue",lwd=2,lty=2)


######################################
#5. Which of the following commands run a linear regression of loan amount being explained by loan duration and credit history, and identifies the variables corresponding p-values below 0.05? 

#a)  
reg <- glm( amount ~ duration + history , data = germancredit)
coef(reg)
#b)	
reg <- glm( amount ~ . , data = germancredit)
summary(reg)$coef
#c)	
reg <- glm( amount ~ duration + history , data = germancredit)
summary(reg)$coef[,3] < 0.05
#d)	
reg <- glm( amount ~ duration + history , data = germancredit)
which( summary(reg)$coef[,4] < 0.05 )

######################################
#6. Consider how the default rate of loans varies with customer's credit history via: 
# aggregate(Default ~ history, data=germancredit,FUN=mean)
# Your intern confronts you with the output saying that people 
# with better credit have more chance of default and therefore they 
# are riskier! For a moment this does not seem to make much sense 
# since you have trust on how credit history was being determined. 
#
# Which of the following justifications is the most appropriate 
# response to your intern?  

#a)  You should rerun the command to confirm the finding: 
  aggregate(Default ~ history, data=germancredit,FUN=mean)
#If it is confirmed, you should agree with the intern (potentially hire him), and       accept the new discovery.

#b)	You run a linear regression to try to confirm the finding: 
  reg <- glm (Default ~ history, data=germancredit)
  summary(reg)
# The model has a dummy for "poor" history, and a dummy for "very poor" history both of which have a (significant) negative coefficient. Thus default rates are higher for "good" history as your intern said and the finding is confirmed.

#c)	You explain to the intern that people with better credit history
#  get shorter loans which are harder to pay as indicated by: 
  aggregate(duration ~ history, data=germancredit,FUN=mean)

#d)	You explain to the intern that people with better credit history 
# are allowed to obtain higher loans which are harder to pay as indicated by: 
  aggregate(amount ~ history, data=germancredit,FUN=mean)




######################################

