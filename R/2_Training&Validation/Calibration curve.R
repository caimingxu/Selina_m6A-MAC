
library(rms)
library(export)

rt=read.table("riskOutput.txt",sep="\t",header=T,row.names=1,check.names=F) 

#5 years
f1 <- cph(Surv(futime, fustat) ~ riskScore+Stage+Position, x=T, y=T, surv=T,time.inc=5, data = rt)
cal1 <- calibrate(f1,cmethod="KM",u=4,method="boot",legend=FALSE,rule="aic",m=16,b=1000)
plot(cal1,
     lwd=3,
     lty=1,
     xlab="Predicted Probability",
     ylab=list("Actual Survival"),
     xlim=c(0,1),
     ylim=c(0,1),
     col="dodgerblue",
     errbar.col = "dodgerblue",
     par.corrected=list(col="dodgerblue")
)
graph2ppt(file="5 year.pptx", width=6, height=6)

par(new=TRUE)  # ?Ƿ???????ͼ?Σ?ÿ????һ??????һ?θ?????

#2 years
f1 <- cph(Surv(futime, fustat) ~ Stage+Position+riskScore, x=T, y=T, surv=T,time.inc=2, data = rt)
cal1 <- calibrate(f1,cmethod="KM",u=3,method="boot",legend=FALSE,rule="aic",m=16.5,b=1000)
plot(cal1,
     lwd=3,
     lty=1,
     xlab="Predicted Probability",
     ylab=list("Actual Survival"),
     xlim=c(0,1),
     ylim=c(0,1),
     col="orangered",
     errbar.col = "orangered",
     par.corrected=list(col="orangered"))
graph2ppt(file="2 year.pptx", width=6, height=6)




##############????C-indexֵ
#library(survival)

#rt=read.table("input.txt",sep="\t",header=T,row.names=1,check.names=F) 
#sum.surv <- summary(coxph(Surv(futime, fustat) ~ ., data = rt))
#c_index <- sum.surv$concordance



#####################
#library(devtools)
#install_github("mdbrown/DecisionCurve")
#library(rmda) 

#model1 <- decision_curve(fustat~Age + grade + riskScore,
#                         data = rt,
#                         thresholds = seq(0, 1, by = .005),
#                         bootstraps = 10)
#model2<- decision_curve(fustat~Age + grade + stage+riskScore,
#                       data = rt,
#                       thresholds = seq(0, 1, by = .005),
#                        bootstraps = 10)
#plot
#plot_decision_curve(list(model1, model2),confidence.intervals=FALSE,
#                    curve.names = c("No stage", "Stage"),
#                   col = c("cornflowerblue", "lightcoral"),cost.benefit.axis=FALSE,
#                   lwd = 4,
#                    standardize=FALSE,
#                    legend.position = "topright")

