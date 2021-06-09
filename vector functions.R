#some additional vector functions
veC = c('Pune', 'Mumbai', 'Nashik', 'Nagpur', 'Delhi', 'Chennai', 'Kolkata', 'Noida')

#grepl
# ?grepl
grepl('n',veC)
#grepl gives true or false, if we index it to a vector, we get values

veC[grepl('n',veC)]

#ordering elements alphabetically
veC[order(veC)]

## addition, multiplication to a vector by a scalar
v = 1:15
adn = v+5
mulpn = v*5
v;adn;mulpn
myD = data.frame(v,adn,mulpn)
myD

##giving header names, using savings bank acc vector
sb = sample(1:15,5)
sb
  #using names function
names(sb) = c("Monday",'Tues','Wed','Thurs','Fri')
sb

##creating a vector using seq function (from, to, step)
nums = seq(1,10,0.5)
nums
