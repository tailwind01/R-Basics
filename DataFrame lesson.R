City <- c("Mumbai","Pune","Delhi", "Kolkata","Chennai")
Region <- c("West","North","East","South")
Sale <- c(100,90,95,80,85)
Region <- c("West","West","North","East","South")
#creating a dataframe
frame1 <- data.frame(City, Region, Sale)
frame1
#often we dont have to manually enter data
data("Titanic")
Titanic
data("mtcars")
mtcars
#using an empty function data() we get all the dataframes in R that have come packaged
data()
#there is also a package named datasets.load that we can import into R using install.packages()
data("BOD")
BOD
#to check what is in datasets we can run data(package=.packages(all.available=TRUE))
# data(package=.packages(all.available=TRUE))
# by using the above command we get list of datasets available packagewise

#we have seen that Titanic data is not in dataframe format, we can simply convert it into a dataframe using the following command
#function > as.data.frame()
t = as.data.frame(Titanic)
t
#we can use readxl or read.csv functions to use external datasets
#be wary of using appropriate slash forward slash(/) instead of backward (\)
#this is the way R handles filepaths
mydata <- read.csv("C:/Users/sai/Documents/1. CFA - Actuarial/1. Actuaries/0. Current/Regarding R/R practice/dataframe lesson/B2B after error resolution.csv")
head(mydata)
library("readr")
#now we have imported readr package, which means we can use its functions like read_csv()

#in mydata, I don't need all the columns, so I select the ones that I need, by using just the column numbers!
#1. subset method
mydata2 <- subset(mydata, select = c(1,3,4,5,6,9,11,12))
mydata2
#2. direct method (select all rows and a combination of relevant columns)
mydatav3 <- as.data.frame(mydata[,c(1,3,4,5,6,9,11,12)])
mydatav3
 #head gives top 6 rows, tail gives bottom 6 rows
head(mydatav3)
tail(mydata2)
#selection
sel <- mydatav3[5:20,2:8] #selected 5th to 20th rows and 2nd to 8th columns
sel

#filtering the data
fil <- mydatav3[,mydatav3$Invoice.Value>5000] #filtered all invoices with value greater than 5000
  #this code generated an error since filtering is done by rows and not columns (values are in rows!)
fil <- mydatav3[mydatav3$Invoice.Value>5000,] #filtered all invoices with value greater than 5000
fil #only those ROWS where the invoice value is greater than 5000!
