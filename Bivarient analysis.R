#BIVARATE Analysis

length(student)
#how many cases in the sheet?
nrow(student)

#Show me top 10 cases
head(student,10)

#Include lower 10 cases
tail(student,10)

#Structure of the data set 
str(student)

#summary of the data set 
summary(student)

#Null values of the sheet
sum(is.na(student))


#Put in define variables as factors

student$gender<-as.factor(student$gender)
str(student$gender)

student$race.ethnicity<-as.factor(student$race.ethnicity)
str(student$race.ethnicity)

student$parental.level.of.education<-as.factor(student$parental.level.of.education)
str(student$parental.level.of.education)

student$lunch<-as.factor(student$lunch)
str(student$lunch)

str(student)

#numerical values as factors
student$math.score<-as.factor(student$math.score)
str(student$math.score)

student$writing.score<-as.factor(student$writing.score)
str(student$writing.score)

str(student)


#Gender Vs Race (categorical Vs Categorical)

library(ggplot2)

#stacked bar plot
ggplot(student,
       aes(x= race.ethnicity,
           fill= gender)) +
  geom_bar(position = "stack")+
  theme(axis.text.x = element_text(angle = 45,
                                   hjust = 1))


#Grouped Bar Chart
ggplot(student,
       aes(x= parental.level.of.education,
           fill= gender)) +
  geom_bar(position = "dodge")+
  theme(axis.text.x = element_text(angle = 45,
                                   hjust = 1))+
  coord_flip()+
  scale_fill_manual(values = c("darksalmon","gold"))+
  labs(title ="Distribution of parental level of education Vs Gender")


#Box Plots

ggplot(student, aes(x= gender,
                    y= math.score)) +
  geom_boxplot(fill = "pink")+
  labs(title = "Distribution of math score Vs Gender")


ggplot(student, aes(x= parental.level.of.education,
                    y= math.score)) +
  geom_boxplot(fill = "palegreen")+
  labs(title = "Distribution of math score Vs parental level")
  theme(axis.text.x = element_text(angle = 45,
                                   hjust=1))

#Scattered Plot
  
ggplot(student,
       aes(x= math.score,
           y= reading.score)) +
  geom_point(color="violetred")+
  geom_smooth(method = "lm")

#