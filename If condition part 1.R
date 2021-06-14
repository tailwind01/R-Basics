#conditional processes in R
#If and IfElse
#If function can take only 1 value in it
#IfElse function can take multiple values, thus it can take
  #the whole range of values stored in a variable as argument
a = 10
#syntax for If function
#if(condition, result if True, value if False)
if(a>5){print("Good Marks")} else{print("Poor Marks")}
a=3  
if(a>5){print("Good Marks")} else{print("Poor Marks")}
a=10
#now we check for more than 1 condition
if(a<3){print("Poor")} else if(a<7){print("OK")} else{print("Good")}
  #checking
a=2
if(a<3){print("Poor")} else if(a<7){print("OK")} else{print("Good")}
a=6
if(a<3){print("Poor")} else if(a<7){print("OK")} else{print("Good")}

#checking marks in 2 subjects
maths = 10
eng = 7
if(maths>7 & eng>7){print("Very Good")}else{print("Average")}
if(maths>=7 & eng>=7){print("Very Good")}else{print("Average")}
#in the 'and' condition, both logics should eval to true
#or operator
if(maths>7 | eng>7){print("Very Good")}else{print("Average")}
qt <- c(2,3,5,7,9,1,2,4,3,1,5,3,5)
#trying "if" on a vector
if(qt>4){print("Check")}else{print("Don't Check")}
##now a warning has come and only first value got used! That's why mention "any"
if(any(qt>4)){print("Check")}else{print("Don't Check")}
## so now we use "IfElse" function
ifelse(qt>4, "Check", "Don't Check")
  #ifelse checks every element of the vector and outputs result
