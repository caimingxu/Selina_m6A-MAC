
library(devtools)
#install_github("mdbrown/DecisionCurve")
library(rmda) 
library(export)
# 5 years
rt=read.table("2 year.txt",sep="\t",header=T,row.names=1,check.names=F) 

model1 <- decision_curve(fustat ~ Age + Stage + Position + riskScore,
                         data = rt,
                         thresholds = seq(0, 1, by = .005),
                         bootstraps = 10)
model2<- decision_curve(fustat ~  Stage ,
                       data = rt,
                       thresholds = seq(0, 1, by = .005),
                        bootstraps = 10)
plot
plot_decision_curve(list(model1, model2),confidence.intervals=FALSE,
                   curve.names = c("Nomogram", "Stage"),
                   col = c("cornflowerblue","cornflowerblue"),
                   cost.benefit.axis=FALSE,
                   lwd = 2:2,
                   lty = 1:2,
                    standardize=FALSE,
                    legend.position = "none")
graph2ppt(file="effect plot.pptx", width=10, height=6)

# 10 years
rt=read.table("5 year.txt",sep="\t",header=T,row.names=1,check.names=F) 

model1 <- decision_curve(fustat ~  Age + Stage + Position + riskScore,
                         data = rt,
                         thresholds = seq(0, 1, by = .005),
                         bootstraps = 10)
model2<- decision_curve(fustat ~  Stage ,
                        data = rt,
                        thresholds = seq(0, 1, by = .005),
                        bootstraps = 10)
plot
plot_decision_curve(list(model1, model2),confidence.intervals=FALSE,
                    curve.names = c("Nomogram", "Stage"),
                    col = c("lightcoral", "lightcoral"),cost.benefit.axis=FALSE,
                    lwd = 2:2,
                    lty = 1:2,
                    standardize=FALSE,
                    legend.position = "none")
graph2ppt(file="5 year.pptx", width=10, height=6)


# 15 years
rt=read.table("8 year.txt",sep="\t",header=T,row.names=1,check.names=F) 

model1 <- decision_curve(fustat ~ Age + Stage + Position + riskScore,
                         data = rt,
                         thresholds = seq(0, 1, by = .005),
                         bootstraps = 10)
model2<- decision_curve(fustat ~  Stage ,
                        data = rt,
                        thresholds = seq(0, 1, by = .005),
                        bootstraps = 10)
plot
plot_decision_curve(list(model1, model2),confidence.intervals=FALSE,
                    curve.names = c("Nomogram", "Stage"),
                    col = c("seagreen3", "seagreen3"),cost.benefit.axis=FALSE,
                    lwd = 2:2,
                    lty = 1:2,
                    standardize=FALSE,
                    legend.position = "none")

graph2ppt(file="8 year.pptx", width=10, height=6)






