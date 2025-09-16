# install.packages("plotROC")

library(plotROC)
library(pROC)
library(export)

rt=read.table("input.txt",header=T,sep="\t",check.names=F,row.names=1)
basicplot=ggplot(rt,aes(d=group,m=METTL3,col="red"))+geom_roc(n.cuts = 0)
tiff("ROC.tiff",width = 1500,height = 1200,res=300)
basicplot+style_roc()
dev.off()
graph2ppt(file="plotROC.pptx", width=7, height=5)

#styleplot          #??ROC
roc=roc(rt$group,rt$METTL3,plot=FALSE,ci=TRUE)
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

library("writexl")
write_xlsx(roc_result,"results.xlsx",col_names = TRUE,format_headers = TRUE,use_zip64 = FALSE)
write.table(roc_result,"results.txt",sep = "\t",row.names = F)
#To show the optimal cutoff on ROC curve
#pdf('Show Cutoff on ROC.pdf',width = 10,height = 8)
#rocobj <- roc(rt$group, rt$riskScore)
#plot(rocobj,
#     legacy.axes = TRUE,
#     main="Best cutoff",
#     thresholds="best", # the best cutoff based on youden index
#     print.thres="best") # show the best cutoff on ROC curve
#dev.off()


######??????????2749657388@qq.com
######????΢??: 18520221056
