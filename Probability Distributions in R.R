#Probability distributions in R

#R has 4 simple functions for each distribution that help us tackle probability distributions
  #rdistr, ddistr, pdistr and qdistr (eg. rnorm, dnorm, pnorm etc)
  #rdistr helps us generate random numbers from a distribution
  #ddistr helps us calculate probability
  #pdistr helps us calculate CUMULATIVE probability
  #qdistr helps us generate quantiles
#binomial distribution
#parameters = n,p
  #let's generate 100 random numbers from binomial dist with n=20, p=0.2
n = 20
p = 0.2
abc = rbinom(100,n,p)
print(abc) #completely random
  #probability of getting 5 successes in such a distribution
p_5 = dbinom(5,n,p) #dbinom(number of successes== ,n,p)
p_5  
  #what is the prob of getting less than 6 successes?
    #means now we want the cumulative distribution function
cp_6 = pbinom(6,n,p)
cp_6

  #to check if distribution is working fine
fi = pbinom(20,n,p)
fi
  #quartiles
first_q = qbinom(0.25, n,p)
first_q
second_q = qbinom(0.5,n,p) #median
second_q
third_q = qbinom(0.75,n,p)
third_q
all_val = qbinom(c(0,0.25,0.5,0.75,1),n,p)
all_val
  #to get mode
mean = mean(abc) #thoeretically, it is 4 (20*0.2)
vari = var(abc) #theoretically, it is 3.2 (20*0.2*0.8)
dens = dbinom(0:20,n,p)
df = data.frame(successes = 0:20, dens)
df
#let's check the shape of the plot constructed
plot(abc, dbinom(abc,n,p))

another = rbinom(abc,n,p)
plot(another, dbinom(another, n,p))

#Example to solve
#1 #A box has 20 balls with numbers 1 to 20 on it.
#We pick a ball randomly out of it. What is the prob that:
  #i) number is even
  #ii) number is greater than 18

  #sol 1: values such as 2,4,6,8,10,12,14,16,18,20 i.e 10 of 20
  dbinom(1,1,10/20)
  #sol 2: values 19,20  i.e 2/20
  dbinom(1,1,2/20)  

#2 #n=5, p[x=1]=0.4096, p[x=2]=0.2048. Find p
  allProb = seq(0,1,by=0.01) #all possible values of p are between 0 to 1
  prob1 = sapply(allProb,function(allProb){dbinom(1,5,allProb)})
  mySolDf = data.frame(allProb, round(prob1,4))  
  library(dplyr)
  ans = mySolDf %>% filter(round.prob1..4.==0.4096)
  ans    

#POISSON Distribution: only 1 parameter, which is called lambda
  #rpois, qpois, dpois, ppois
  x = rpois(100,4) #random number generation
  mean(x)
  sd(x)
  var(x)  
  dpois(3,4)  #prob x==3
  ppois(3,4)  #cum prob, x<=3
  dpois(4,4)
  plot(x, dpois(x,4))    
  max(dpois(c(0:20),4))  #maximum probability
  
  #example
  #p(x>=2) and p(x<5): values of concern: 2,3,4
  sum(dpois(c(2:4),4))
  
  #example x~Poi with 'l' such that probability of having 0 and 1 event is the same. Find l.
  alPoss = sapply(p<-seq(1:20), function(p){dpois(c(0,1),p)})
  #we find that p=1 is the solution
  
  
#some more functions for discrete distributions that could be studied are:
  #rgeom(x, parameter)
  #dgeom(x, parameter)
  #pgeom(x, parameter)
  #qgeom(x, parameter)
  #rnbinom(x, k, p)
  #dnbinom(x, k, p)
  #pnbinom(x, k, p)
  #qnbinom(x, k, p)
  #rhyper(x, k, N-k, n)
  #dhyper(x, k, N-k, n)
  #phyper(x, k, N-k, n)
  #qhyper(x, k, N-k, n)
  #runif(x,min,max)
  #dunif(x,min,max)
  #punif(x,min,max)
  #qunif(x,min,max)
  
#Normal distribution: parameters mean, sd
  rnorm(100,0,1)
  a = rnorm(1000)  
  mean(a)  
  sd(a)  
  var(a)  
  
  #example: X~N with mean 14 and variance 20
  #p(x<14)
  pnorm(14,14,sqrt(20))
  pnorm(scale(14,14, sqrt(20)))  #scaling values.
    #scale function: number you want to scale, mean of the observations, standard deviation of the observations
  
#some other continuous distributions
  #rgamma(x, shape=alpha, scale=lambda)
  #dgamma(x, shape=alpha, scale=lambda)
  #pgamma(x, shape=alpha, scale=lambda)
  #qgamma(quantile, shape=alpha, scale=lambda)
  #rexp(x, parameter)
  #dexp(x, parameter)
  #pexp(x, parameter)
  #qexp(quantile, parameter)
  #rchisq(x,dof)
  #pchisq(x,dof)
  #dchisq(x,dof)
  #qchisq(quantile,dof)
  #rbeta(x,a,b)
  #dbeta(x,a,b)
  #pbeta(x,a,b)
  #qbeta(quantile,a,b)
  #rlnorm(x, mu, sd) #lognormal
  #dlnorm(x, mu, sd)
  #plnorm(x, mu, sd)
  #qlnorm(quantile, mu, sd)
  #rt(x,dof) ###t-distribution
  #dt(x,dof)
  #pt(x,dof)
  #qt(quantile,dof)
  #rf(x, n1, n2) # F- distribution
  #df(x, n1, n2)
  #pf(x, n1, n2)
  #qf(quantile, n1, n2)
  #rweibull(x, shape, scale) ## Weibull distribution
  #dweibull(x, shape, scale)
  #pweibull(x, shape, scale)
  #qweibull(x, shape, scale)
  
  dchisq(1,1)
  dnorm(1)  
  d = rt(1000,50)  
  plot(d, dt(d, 60))  
  k = rnorm(10000)  
  plot(k, dnorm(k))  
  
  #how a t distribution approaches normal
    #should have high number of degrees of freedom
  myTdist = rt(1000,90)
  plot(myTdist, dt(myTdist,90))
  rnorms = rnorm(1000)  
  points(rnorms, dnorm(rnorms), col="Red") #points added to original plot
  
  