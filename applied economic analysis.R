install.packages("AER")
library(AER)

data("CPS1985")
str(CPS1985)



## Exercise 1
#In the first exercise, we will calculate simple statistics of wage in the CPS1985 data-frame. 
#First, use the summary function to see the summary statistics of wage; 
#then, calculate mean, median, variance, and standard deviation of the wage.

df <- CPS1985
summary(df$wage)
var(df$wage)
sd(df$wage)



## Exercise 2
#Graphical illustration of statistics would be also helpful. 
#Since wage is numerical, histograms (density plot) and box-plots would be helpful. 
#In this exercise, create a histogram for a wage parameter in the CPS1985 data-frame.

hist(log(df$wage),freq = FALSE)
lines(density(log(df$wage)),col=4)



## Exercise 3
#As for categorical variables, it is not possible to calculate mean and variance. 
#Instead, we can produce frequency tables, bar-plots, and pie charts. 
#In this exercise, use a table function to produce a frequency table for sector and occupation variables. 
#Along with these, produce bar-plots and pie charts for these variables.

tab <- table(df$sector)
tab
barplot(tab)
pie(tab)

tab2 <- table(df$occupation)
tab2
barplot(tab2)
pie(tab2)



## Exercise 4
#It would also be useful to see the relationship between two categorical variables. 
#In this exercise, consider the gender and occupation variables. 
#Use the xtabs function to show the contingency table, 
#then use the plot function to plot a bar-plot showing gender proportion for each occupation type.

xtabs(~ gender + occupation, data = df)
plot(gender~occupation, data=df)



## Exercise 5
#In this exercise, first calculate the correlation between wage and education to investigate how wage changes by education, 
#then calculate the mean wage for each gender. 
#Finally, compare the wage between males and females using box-plots and qq plots.

cor(log(df$wage),df$education) #-1<cor<1 (1 indicates a strong positive relationship)

tapply(log(df$wage), df$gender, mean)
plot(log(df$wage) ~ df$gender)

malewage <- subset(df, gender == "male")$wage
femalewage <- subset(df,gender == "female")$wage
qqplot(malewage,femalewage,xlim=range(df$wage),ylim=range(df$wage))
abline(0,1)
