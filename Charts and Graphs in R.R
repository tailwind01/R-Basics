#Data viz in R
  #scatterplot, bar-graph etc.
  #console features are limited, so ggplot2 is reqd
library(ggplot2)
#let's load some data
myData = read.csv("RishabhTidied.csv")
library(tidyverse)
#inbuilt options
#only India tax collections as % of GDP
indiaTax = myData %>% filter(country=="India")
indiaTax %>% head() #some EDA
plot(indiaTax$Year, indiaTax$percent.of.GDP)
#dev.off()
barplot(indiaTax$percent.of.GDP)
barplot(indiaTax$percent.of.GDP, names.arg = indiaTax$Year)
barplot(indiaTax$percent.of.GDP, names.arg = indiaTax$Year, main = "India Tax Collections through years", xlab = "Year", ylab = "Tax Collections as % of GDP", col = c("blue","green"))

