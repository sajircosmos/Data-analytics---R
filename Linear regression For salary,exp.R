
Salarydata=read.csv(file.choose(), header=TRUE)
View(Salarydata)
head(Salarydata)

data.frame(Salarydata)
summary(Salarydata)
colnames(Salarydata)=c("yearsexp","Salary")# Changing Column Name as per my requirement 

?data.frame

#### Checking Normality test (Q Q test) whether data is normally distributed or not 
attach(Salarydata)
qqnorm(yearsexp)
qqline(yearsexp)

qqnorm(Salary)
qqline(Salary)

#### Checking Histogram & boxPlot Graphs 
hist(yearsexp)
hist(Salary)

boxplot(yearsexp)
boxplot(Salary)


#### Scatter Plot #####
plot(yearsexp,Salary,main = "AMARON BATTARIES SALARY FOR EXPERIENCE",col="blue", col.main="orange", col.lab="red", xlab="Years Of Experience",ylab="salary",pch=20)

cor(yearsexp,Salary) # # Correlation Coefficient value is 0.978 , strenth is strong, direction positive


#####   Simple Linear Model 
model1=lm(Salary~yearsexp,data = Salarydata)
summary(model1)
### R^2 Value is 0.957
confint(model1,level=0.95)
predict(model1,interval="predict")

### Hence here   No Need To require  Tranformation function for improving R^2 value because 
### alredy out first Model got 95% ,its too enough to predict, if in case R^2 Value low we will use
### Tranformation functions like sqrt,log,1/sqrt,exponential ...etc






