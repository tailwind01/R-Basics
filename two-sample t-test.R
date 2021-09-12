#Two sample T-test
#difference of means test
library(readxl)
sale_data <- read_excel("sale-data.xlsx")
sale_data
#Two sample t-test
t.test(sale_data$Delhi,sale_data$Mumbai, var.equal = TRUE)
?t.test
t.test(sale_data$Delhi,sale_data$Mumbai)

#paired t-test
library(readxl)
paired_data <- read_excel("paired-data.xlsx")
t.test(paired_data$After,paired_data$Before,alternative = "greater",conf.level = 0.95,paired=TRUE)
