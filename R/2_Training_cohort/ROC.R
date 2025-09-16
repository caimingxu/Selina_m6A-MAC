
# install.packages("plotROC")

library(plotROC)
library(pROC)
library(ggplot2)
library(export)

rt=read.table("input.txt",header=T,sep="\t",check.names=F,row.names=1)
tiff("ROC.tiff",width = 1500,height = 1200,res=300)
basicplot=ggplot(rt,aes(d=group,m=METTL3,col="red"))+geom_roc(n.cuts = 0)
#pdf('plotROC.pdf',width = 10,height = 8)
basicplot+style_roc()
graph2ppt(file="plotROC.pptx", width=7, height=6)
dev.off()

#styleplot          #??ROC
roc=roc(rt$group,rt$METTL3,plot=FALSE,ci=TRUE)

#pROC::coords(roc(rt$group,rt$riskScore), "best", transpose = TRUE, input="threshold", best.method="youden")


auc=auc(roc)          #????AUCֵ 
CI=as.numeric(roc$ci)
LL <- CI[1]
HH <- CI[3]
v <- var(roc)
b <- roc$auc - .5
se <- sqrt(v)
z <- (b / se)
p <- 2 * pt(-abs(z), df=Inf)  ## two-sided test p-value

#------------------------------------------------------------------
#To calculate the optimal cutoff, 95%CI, auc, sensitivity, specificity, p-value
roc_result <- coords(roc, "best")
roc_result$auc <- auc
roc_result$'95L'<- LL
roc_result$'95H'<- HH
roc_result$'pValue'<- p

write.table(roc_result,"METTL3_results.txt",sep = "\t",row.names = F)


#To show the optimal cutoff on ROC curve
#pdf('Show Cutoff on ROC.pdf',width = 10,height = 8)
#rocobj <- roc(rt$group, rt$riskScore)
#plot(rocobj,
#     legacy.axes = TRUE,
#     main="Best cutoff",
#     thresholds="best", # the best cutoff based on youden index
#     print.thres="best") # show the best cutoff on ROC curve
#dev.off()

