empdata=read.csv("empdata")
empdata=read.csv("emp_data")
View(empdata)
head(empdata)
attach(empdata)
colnames(empdata)=c("sh","cor")


#### Normality test Whether data is normally distributed or not (Q Q Test)##
qqnorm(sh)
qqline(sh)

qqnorm(cor)
qqline(cor) ### Hence both the data has Normally Distributed Statistically Proved By Q Q Test

#### Scatter Plot ###
plot(cor,sh)### By Seeing Scatter Plot we Concluded that direction is negative,Strength is strong
cor(cor,sh) # r Value is -0.911 so Negative correaltion each other 

#### simple Linear Model ###
model1=lm(cor~sh,data=empdata)
summary(model1)### Hence R^2 Value Is 0.821 hence is moderate so improve R^2 Value using Transform Function
confint(model1,level = 0.95)
predict(model1,interval = "predict")


### Transform The data using Log Function ###
model1=lm(log(cor)~log(sh),data=empdata)
summary(model1) 

### Hence R^2 Value Improved From 0.821 to 0.889 by using Log Transform 
### P value is 4,33*10^-5, which is < 0.05
### Conclusion: statistically Proved That Salary Hike (sh) Increases ,Decrease The Chur out rate(cor)
