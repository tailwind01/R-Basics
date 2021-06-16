#corrplot and corrgram

#1. corrplot
  #method : 7 options: circle,square,pie,shade,ellipse,number, color
  #type/layout: layout of graph: full matrix or upper portion(triangle) or lower portion(triangle)
      #in correlation matrix, upper and lower triangles will be mirror images of one another
  #order: order in which display will be done: AOE, HPC, HClust, Alphabet
      #AOE: angular order of eigenvectors: orders factors based on this
      #FPC: first principal component
      #HClust: hierarchial clustering
      #Alphabet: orders alphabetically
  #color: specify color of method etc., the previous args are essential
library(corrplot)
library(corrgram)
library(dplyr)
data("mtcars")
myData = as.matrix(mtcars)
  #the correlation functions require matrix as input, that's why it's crucial to convert the data in matrix form before proceeding further
#creating correlation matrix
  #let's try to calculate correlation between horsepower(hp) and carbon(carb) 
hp_and_carb = myData[,c(4,11)] #select cols 4 and 11
data1 = cor(hp_and_carb) #cor: takes a matrix as input

data2 = cor(myData) #of all the variables in matrix!
              #since there are 11 variables, the output is 11x11 matrix
              #values in upper triangle are a mirror image of values in lower triangle
#use corrplot package
corrplot(data2, method = "circle")
      #we can see that the size of circle reduces as the correlation gets close to (approaches) 0
corrplot(data2, method = "color", type = "upper") #only upper half
corrplot.mixed(data2, lower = "square", upper = "circle")
corrplot.mixed(data2, lower = "square", lower.col = "purple",upper = "circle", upper.col = "black")
corrplot(data2, method = "circle", bg = "grey", type = "upper") #bg will not work for "color" method
    #changing text color
corrplot(data2, method = "circle", bg = "grey", type = "upper", tl.col = "black") #"tl.col = " is for text color, tl stands for text label
corrplot(data2, method = "circle", bg = "grey", type = "upper", tl.col = "black", tl.srt = 45) #"tl.col = " is for text color, tl stands for text label
  #looking at ordering, ordering helps us in getting hidden patterns in corrplot
corrplot.mixed(data2, lower = "circle", upper = "color", order = "AOE")
    #Angular order of Eigenvectors
corrplot.mixed(data2, lower = "circle", upper = "color", order = "FPC")
    #this is basically principal-component method
corrplot.mixed(data2, lower = "circle", upper = "color", order = "hclust")
    #breaks the data into clusters
      #more options of hclust are below
corrplot(data2,method = "square", order = "hclust", addrect = 2)
      #addrect added 2 rectangles, meaning two clusters      
myCols = colorRampPalette(c("purple","red","orange","green","blue"))
    #adding colors
corrplot(data2,method = "square", order = "hclust", addrect = 2, col=myCols(5))
corrplot(data2,method = "square", order = "hclust", addrect = 2, col=myCols(5), bg='grey', tl.col = "black", tl.srt = 45)

#let's look at corrgram
  #syntax corrgram(data, order =(bool) , panel= (Pie | Shade | Ellipse | PTS[scatterplot]) , lower.panel= , upper.panel= , text.panel= ,diag.panel = ,)
corrgram(data2, order= TRUE, lower.panel = panel.pie, upper.panel = panel.shade, text.panel = panel.txt)
