#proportion testing using the Z test
n_employed <- 1000
employed_insured<-810
n_businessmn <- 1000
businessmn_insured <- 750
p_a <- employed_insured/n_employed
p_b <- businessmn_insured/n_businessmn
#null: PA=PB
#alternate: PA!=PB

pooled_prop <- (employed_insured+businessmn_insured)/(n_employed+n_businessmn)
z_stat <- (p_a-p_b)/(sqrt((pooled_prop)*(1-pooled_prop)/n_employed + (pooled_prop)*(1-pooled_prop)/n_businessmn))
z_stat

prop.test(x=c(810,750),n=c(1000,1000))
###
# INTERVAL DOESNT CONTAIN ZERO,SO NULL REJECTED