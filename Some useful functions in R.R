#some useful and important functions in R
#let's import some data
data("mtcars")
nMT = nrow(mtcars)
dimen = dim(mtcars)
print(dimen)
nms = names(mtcars)
#freq of observations
freqTbl1 = table(mtcars$hp)
freqTbl2 = table(mtcars$carb)
print(freqTbl1)
#normal distribution functions
  #rnorm: number of observations we want to generate, mean, sd
ser = rnorm(55) #standard normal distribution
print(ser)
ser2 = rnorm(100, mean=10, sd=3.3)

#apply function: first: dataset, second arg:do we want function application across rows or columns (if across columns then 1, else for all rows in one column: 2), third parameter: the function that we want to apply
  #helps in applying a function on multiple columns
library(dplyr)
myTab = mtcars 
myTab$total1 = apply(myTab, 1, sum)
myTab$total2 = apply(myTab[,1:11], 1, max)

#lapply: user defined function apply
  #lapply gives output in list format, thus we have to convert it every time into data frame format
myfn = function(x){x = x*2}
myTab$funct = lapply(myTab[,4],myfn)

#ppois, pbinom
  #poisson distribution prob, binominal dist probability

#possion #rate of queries is 10 queries per day, what's the probability of receiving more than 15 queries in a given day :: Poisson distribution question
    #lambda is 10, we want probability of x>15 given lambda=10
pgt_15 = ppois(15,10,lower.tail = FALSE) #by writing lower.tail = FALSE, we have derived probability of x being greater than 15
        #had we written lower.tail=TRUE, we would have gotten the cumulative distribution function

  #binomial distribution
  #50 questions, each question has 4 options
  #we want to find prob that there are 10 or less than 10 correct answers
    #prob of correct ans = 0.25, prob of wrong ans = 0.75
plessth_10_binom = pbinom(10,50,0.25) #we want CDF at 10, and lower.tail is by default true, so we dont change it


#merge: in merging 2 tables, like vlookup in Excel
  #merge(table1, table2, by.x="common col name", by.y="common column name")