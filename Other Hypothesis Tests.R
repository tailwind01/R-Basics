#---------------------------------------------------------------------------
#CONTINGENCY TABLE
  #to test if the attributes defining the observations are independent
  
#---------------------------------------------------------------------------
#?matrix Help sought to create the matrix
#---------------------------------------------------------------------------
matrix1 <- matrix(data = c(3,78,103,47,32,29), nrow = 3, ncol = 2, dimnames = list(c("Death", "Severe Injury", "Minor Injury"),c("Wearing seatbelt", "Not wearing seatbelt")))
matrix1
cont.test <- chisq.test(matrix1, correct = FALSE)
summary(cont.test)
cont.test$expected
cont.test$p.value
cont.test$statistic
#---------------------------------------------------------------------------
# if we pass x-value which has either 1 row or column, then R will by default
# perform goodness of fit test
# If we pass data that has 2 or more rows or columns, then R will prepare the
# contingency table
#---------------------------------------------------------------------------

#---------------------------------------------------------------------------
# mtcars data used for demonstrating chisq test
# variables used: cyl= no. of cylinders, carb=no. of carburators
#---------------------------------------------------------------------------
mtcars
chisq.test(table(mtcars$carb,mtcars$cyl))


#---------------------------------------------------------------------------
# F test: used to test ratio of 2 population variances
#---------------------------------------------------------------------------
set.seed(77)
SA <- rnorm(200, mean=2, sd = 5)
SB <- rnorm(200, mean=2, sd = 3)

var.test(SA, SB)
#--------------------------------------------------------------------------
# since the confidence interval does not contain 1, the variance ratio 
# is not equal to 1. Or alternatively, since the p-value is less than
# even 0.01, we can reject the null.


#--------------------------------------------------------------------------
# Testing the value of a population proportion using binom.test
#suppose, we have 62 females out of 100 employees
# We want to test for the proportion of females in the company
# we will use the binom.test() function (binom test has by default H0_p=0.5)
# Our null hypothesis is that p=0.5
#--------------------------------------------------------------------------
binom.test(x=62, n=100)
# ?binom.test

#--------------------------------------------------------------------------
# Testing the mean of the Poisson distribution
# Format : poisson.test(x,T,r, conf.level)
# A total of 800 claims were made on portfolio of 5000 policies
# Assume that the number of claims follow a Poisson distribution
# Check for the parameter be less than 0.175 at 1% level of significance
#--------------------------------------------------------------------------

poisson.test(x=800,T=5000,r=0.175, alternative = "less", conf.level = 0.99)
#--------------------------------------------------------------------------
# This solution is peculiar in a sense that we accept the alternative
# and alternative is framed in 'less than' fashion
# Here we reject the null that lambda==0.175 since we have evidence
# against the null hypothesis (p value is 0.005388)
#--------------------------------------------------------------------------


#--------------------------------------------------------------------------
# testing for correlation coefficient
# First, we will look at bivariate data
# cor.test(x,y,method,alternative, conf.level)
# by default method is Pearson, we can change it to Spearman/Kendall
#--------------------------------------------------------------------------

series1 <- 1:6
series2 <- (1:6)^2
cor.test(series1,series2)
cor.test(series1,series2, method = "pearson")
cor.test(series1,series2, method="kendall")
cor.test(series1,series2, method = "spearman")