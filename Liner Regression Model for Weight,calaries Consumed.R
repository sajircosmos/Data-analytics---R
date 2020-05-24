caloriesconsumed=read.csv("caloriesconsumed")
View(caloriesconsumed)
head(caloriesconsumed)## Checking first 5 values of data
attach(caloriesconsumed)
colnames(caloriesconsumed)=c("wgg","cc")# Changing Column name as per my Requirement


#### Basic Visualization graphs (boxplot And Histogram)
hist(wgg)
hist(cc)

boxplot(wgg)
boxplot(cc) ### Hence there is no outliers in the given data ,statistically checked by using Boxplot

#### Notmality Test Where data Is Normally distributed Or Not (Q Q test)
qqnorm(wgg)
qqline(wgg)

qqnorm(cc)
qqline(cc)

###Plot The Scatter for Check relationship between the Variable
plot(wgg,cc) # by seeing the scatter plot wgg vs cc we concluded that the strong positive strength
cor(wgg,cc) #  r ( corelation co efficient) value is 0.94 so it is strong model


### simple  Linear Regression Model####
model1=lm(cc~wgg,data=caloriesconsumed)
summary(model1)
confint(model1,level=0.95)
predict(model1,interval="predict")

### hence r(corelation co efficient) value is 0.94 , our model is strongly predict the weight gained using calories consuming
## P value 2.85*10^-7 ,which is < 0.05
### R^2 Value is 0.896 , if high R^2 value Our Model is better
