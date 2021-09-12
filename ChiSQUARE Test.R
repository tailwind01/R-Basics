#Chi Square Test
observed <- c(427,265,141,65,78,97,121,257,128)
expectedFreq <- c(433.53,245.49,122.63,55.87,71.54,81.53,114.46,318.84,135.12)
expProb <- prop.table(expectedFreq)

chisq.test(observed, p=expProb)
#P-VALUE Output: 0.464% 