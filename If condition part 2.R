#let's import some data first
data("mtcars")
head(mtcars)
#let's classify cars based on HorsePower (hp)
library(dplyr)
library(ggplot2)
#let's do some Exploratory Data Analysis first
mtcars %>% ggplot(aes(x=hp, y=carb)) + geom_point()
#we see that based on HP 4 categories could be made
#less than 100, 100 to 200, 200 to 300, 300 above
#less than 100 = compact car
#100 to 200 = sedan car
#200 to 300 = SUV
#above 300 = Supercar
mtcars$category = ifelse(mtcars$hp<100,"Compact", ifelse(mtcars$hp<200, "Sedan", ifelse(mtcars$hp<300, "SUV","Supercar")))
myTab <- mtcars %>% select(hp, category)
myTab
#now we will summarise the data
mySummary <- myTab %>% group_by(category) %>% summarise(carnums = n())
mySummary
#function "n()" is used for counting in R
#now that we have established the categories, let's see the carbon emission
#levels for carbon emission
  #| upto 3 - low
  #| 3 to 6 - high
  #| above 6 - very high
mtcars<- mtcars %>% mutate(carb_categ = ifelse(carb<3, "Low", ifelse(carb<6, "High", "Very High")))
mySumm2 = mtcars %>% select(carb_categ) %>% group_by(carb_categ) %>% summarise(cat_count=n())
#double group by drill down
mySumm3 = mtcars %>% select(category, carb_categ) %>% group_by(category, carb_categ) %>% summarise(splCount=n())
mySumm3 %>% head()
mySumm4 <- mtcars %>% select(category, carb, carb_categ) %>% group_by(category, carb_categ) %>% summarise(avgEmission=mean(carb), num_obs = n())
mySumm4 %>% head()
#arranging in desc order
f_summ4 <- mySumm4 %>% arrange(desc(avgEmission))
f_summ4
