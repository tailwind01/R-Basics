#Vector
vNum = c(1,2,3,4,5,6)
vNum


#Factors
genders = factor(c("Male","Female","Male","Male","Female","Male","Female","Female","Male"))
genders


#Matrix 
i = 1:12
mymat = matrix(i,nrow=4,ncol=3)
mymat
mymat_byrow = matrix(i,nrow=4,ncol=3,byrow=TRUE)
mymat_byrow


#Array
v=1:24
  #we ensured 24 elements as multiplication of dims below will yield 24
myArr = array(v,dim =c(4,3,2))
myArr

#Dataframes
cities = c('Mumbai', 'Chennai', 'Delhi', 'Kolkata', 'Noida')
sales = c(30,50,45,67,80)
days = c('Mon', 'Tues', 'Wed', 'Thurs', 'Fri')

  #Creating a *dataframe*
myDF = data.frame(cities, sales)
myDF
