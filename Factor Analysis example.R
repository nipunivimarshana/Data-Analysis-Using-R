#Factor Analysis

food<-read.csv("C:\\Users\\HMNV HERATH\\Desktop\\SLTC\\SEMESTER 06\\Stat\\food-texture.csv")
#structure the data set
str(food)

#Clean the data set
#we have an X variable in the first column. 
#we can use a -1 in the column index to remove the first column and save our data to a new object.

food_new<- food[ , -1]
head(food_new)

# correlations matrix
#s to determine if factor analysis is appropriate.

#install.package ("corrplot")

library(corrplot)
datamatrix<- cor(food_new[,c(-5)])
corrplot(datamatrix, method="number")


#scree plot
#install.packages("psych")

library("psych")

#to decide number of factors
scree(food_new, pc=FALSE)   #use pc=FALSE for factor analysis

#we should get the factors near and above eigen value =1


#conducting the factor analysis using factanal() function
food.fa.none <- factanal(food_new, factors = 2, rotation ="none")
food.fa.none

#Uniqeness= Crispy (0.042): Most of its variance is explained by the factors, making it highly relevant.

#make a scatter plot
#to perform Factor rotation

food.fa.none <- factanal(food_new,factors=2,rotation="none")
food.fa.varimax <- factanal(food_new, factors =2,rotation = "varimax")
food.fa.promax <- factanal(food_new, factors =2,rotation = "promax")
par(mfrow = c(1,3))
plot(food.fa.none$loadings[,1],
     food.fa.none$loadings[,2],
     xlab= "Factor 1",
     ylab= "Factor 2",
     ylim= c(-1,1),
     xlim= c(-1,1),
     main= "No rotation")
text(food.fa.none$loadings[,1]-0.08,
     food.fa.none$loadings[,2]+0.08,
     colnames(food),
     col="blue")
abline(h = 0 , v= 0 )

plot(food.fa.varimax$loadings[,1],
     food.fa.varimax$loadings[,2],
     xlab= "Factor 1",
     ylab= "Factor 2",
     ylim= c(-1,1),
     xlim= c(-1,1),
     main= "varimax rotation")
text(food.fa.none$loadings[,1]-0.08,
     food.fa.none$loadings[,2]+0.08,
     colnames(food),
     col="blue")
abline(h = 0 , v= 0 )

plot(food.fa.promax$loadings[,1],
     food.fa.promax$loadings[,2],
     xlab= "Factor 1",
     ylab= "Factor 2",
     ylim= c(-1,1),
     xlim= c(-1,1),
     main= "promax rotation")
text(food.fa.none$loadings[,1]-0.08,
     food.fa.none$loadings[,2]+0.08,
     colnames(food),
     col="blue")
abline(h = 0 , v= 0 )


# Taking a look on the figures above is appears that factor 1 accounts for pastry, which is dense and can be bend a lot before it breaks. Whereas factor 2 accounts for pastry that crispy and hard to break apart. So, if we need to names these factors, 
#we would probably call them soft pastry (factor 1) and hard pastry (factor 2).