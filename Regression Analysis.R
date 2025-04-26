
#Simple Logistic Regression

#The simple logistic regression is used to predict the probability of class membership based on one singl predictor variable.
#Eg: Suppose that a researcher is interested in how variables, such as GRE (Graduate Record Exam scores),
#GPA (grade point average) and prestige of the undergraduate institution, effect admission into graduate school. The response variable, admit/don’t admit, is a binary variable.

#Load the dataset into R

data<- read.csv("C:\\Users\\HMNV HERATH\\Desktop\\SLTC\\SEMESTER 06\\Stat\\binary (1).csv")

#Do a basic descriptive analysis for all the variables accordingly.

#for this get basic descriptive for the entire data set by using summary.
summary(data) 

#convert rank variable from integer to factor.
data$rank<-as.factor(data$rank)
str(data$rank) 

#Build the simple logistic regression model by considering variables “ADMIT ,GPA” only

#create a simple logistic regression model for the response admit and independent gpa. 
slogit<- glm(admit ~ gpa, data=data, family = "binomial")   #Binomial - 2 Options (0,1)
summary(slogit) 

#Interpret the output.


#Multiple Logistic Regression
mlogit<-glm(admit~gre+gpa+rank, data = data, family = "binomial") 
summary(mlogit)


#example 2
#mlogit<-glm(remiss~cell+smear+infill+lil blast+temp, data = leukemia, family = "binomial") 

