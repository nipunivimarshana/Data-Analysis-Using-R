#Simple Linear Regression

income<-read.csv("C:\\Users\\HMNV HERATH\\Desktop\\SLTC\\SEMESTER 06\\Stat\\income.data.csv")
summary(income)

# Make sure your data meet the assumptions.

#Normality'
hist(income$happiness) 

#Linearity 
plot(happiness ~ income, data = income)

#Perform the Simple Linear Regression analysis

lm <- lm(happiness ~ income, data = income)
summary(lm) 

#plot income and happiness along with the least square regression line
plot(income$income, income$happiness) 
abline(lm) 

#Check for Homoscedasticity 
plot(predict(lm), residuals(lm)) 


