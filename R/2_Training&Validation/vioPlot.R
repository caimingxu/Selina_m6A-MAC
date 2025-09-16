library(sm)
library(zoo)
library(ggplot2)
library(vioplot)

rt <- read.table("input.txt",header = T,sep = "\t",check.names = F)
ggplot(rt, aes(x = rt$group, y = rt$expression)) + 
  geom_violin(aes(fill = rt$group), trim = FALSE) +
  geom_boxplot(width = 0.1) +
  theme_classic() +
  theme(legend.position = "none")

library(export)
graph2ppt(file="violin.pptx", width=5, height=5)
