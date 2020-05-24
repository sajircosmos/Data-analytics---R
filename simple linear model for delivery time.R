deliverytime=read.csv("deliverytime")
View(deliverytime)
head(deliverytime)### First 5 Rows of Data will print
tail(deliverytime)### Lat 5 rows of data will print
attach(deliverytime)
colnames(deliverytime)=c("dt","st")## Changing Column Names As per our requirement

#### Normality teat whether data is normally distributed or not ( Q Q Test)
qqnorm(dt)
qqline(dt) ## by seeing QQ Plot dt  Data  Normally distributed

qqnorm(st)
qqline(st)## by seeing QQ Plot st  Data also almost   Normally distributed

########## Scatter Plot ####
plot(dt,st) ## hence by seeing scatter plot we concluded that  strength is moderate, direction is  positive 
cor(st,dt) ### r Value is 0.82 , Model strong


#### simple Linear Regression Model###
model1=lm(st~dt,data=deliverytime)
summary(model1)### Hence R^2 value is 0.6823 week model

confint(model1,level=0.95)
predict(model1,interval = "predict")

#### Transform the data using Log function both dependent and independent variable###
model2=lm(log(st)~log(dt),data = deliverytime)
summary(model2) # R^2 Value improved 0.6823 to  0.778 now my model is moderately good
