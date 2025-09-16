
library(survival)
#Nomogram
rt=read.table("input.txt",sep="\t",header=T,row.names=1,check.names=F)   #??ȡ?????ļ?
sum.surv <- summary(coxph(Surv(futime, fustat) ~ Stage+Position+riskScore, data = rt))
c_index <- sum.surv$concordance
c_index


#Stage
sum.surv <- summary(coxph(Surv(futime, fustat) ~ Stage, data = rt))
c_index <- sum.surv$concordance
c_index

#riskScore
sum.surv <- summary(coxph(Surv(futime, fustat) ~ riskScore, data = rt))
c_index <- sum.surv$concordance
c_index
