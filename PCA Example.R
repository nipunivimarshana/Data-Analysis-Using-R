#PCA 

#install factoextra 
library("factoextra")
data("decathlon2")

# sub setting active individuals and active variables for the principal component analysis:
data("decathlon2")
decathlon2.active <- decathlon2[1:23, 1:10]
head(decathlon2.active[,1:6],4)

#standardize variable
dec<-scale(decathlon2.active)

#compute principle component analysis
pca<- princomp (dec,cor=T )
summary(pca)

#now we can interpret the output
#in here first component describe 41% of the variation

#scree Plot
screeplot(pca, type="lines")

#coefficient for the principle component
pca$loadings[,1:5]

#now we can interpret the output


