#One way ANOVA
shelf1 <-c(45,26,60,28,50,35,36,19,57,13,38,33,35,49,21,60,22,32,44,26)
shelf2 <-c(29,14,47,37,29,39,55,49,52,25,33,42,55,43,19,58,22,41,34,54)
shelf3 <-c(36,56,19,51,11,28,34,54,26,32,42,35,48,26,32,23,14,14,48,21)
shelf4 <-c(10,55,44,32,31,25,51,51,13,55,14,21,48,43,40,16,10,50,47,22)

# meanTable <- c(mean(shelf1),mean(shelf2),mean(shelf3),mean(shelf4))
# meanTable
# 
# ?as.data.frame
# consodata <- as.data.frame(c(shelf1,shelf2,shelf3,shelf4), row.names = c(rep("D1",20),rep("D2",20),rep("D3",20),rep("D4",20)), col.names="SaleQt")
# consodata
# 
library(readxl)
ANOVAData <- read_excel("ANOVAData.xlsx")

# library(tidyverse)

anovatable <-aov(ANOVAData$SaleQty~ANOVAData$Shelf)
summary(anovatable)

attach(ANOVAData)
aov.usingattach <- aov(SaleQty~Shelf)
summary(aov.usingattach)
detach(ANOVAData)
