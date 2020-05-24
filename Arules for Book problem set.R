book <- read.csv("D:/excelR/Dataset/Book.csv")
View(book)
install.packages("arules")
library(arules)
install.packages("arulesViz")
library(arulesViz)
attach(book)
str(book) # checking the what type of data set 
class(book)
# making rules using apriori algorithm 
#  changing support and confidence values to obtain different rules
?apriori
# Apriori algorithm for support =0.02,confidence =0.5
Arules=apriori(as.matrix(book),parameter=list(support=0.02,confidence=0.5))
Arules # set of 672 rules


inspect((sort(Arules,by="lift"))) # Sort the Highest lift ratio in decending order 

### here the highest lift ratio is 14.122 and we concluded that the if he/she  will buy the 
## {doltybks,artbks,italcook}  and also he/she  would like to buy {italart} also we suggest the vender/client this rule is  first and top most rule
### in same lift ratio 14.122 another combination i,e {cooksbks,doitybks,artbks,italcook} and also  he/she  would like to buy {italart}
## we can say to client/vendor  either the combination you will select the first because both have same lift ratio

## rule3:The lift ratio is 13.74, he/she will buy {artbks,geogbks,italcook} and also he/she will buy {italart}
### rule4:The lift ratio is 13.74 ,he/she will buy {cookbks,artbks,geogbks,italcook} and also he/she will buy {italart}
### rule5: The lift ratio is 13.68,he/she will buy {artbks,italcook}and also he/she will buy {italart}



# Building arule2 using apriori algorithm( the support value 0.04 & confidence =0.5)
arule2=apriori(as.matrix(book),parameter = list(support =0.04,confidence=0.5))
arule2 # set the 290 rules 


inspect((sort(arule2,by="lift"))) # Sort the Highest lift ratio in decending order 
## rule1: the highest lift ratio 4.14, if he/she will buy {italart} and also he/she will buy {artbks}
## rule2: the lift ratio 4.14 only but combination different i,e {cookbks,italart} he/she also buy {artbks}
## So what we can say that the vender/clinet you can take either the combination because lift raion both the combibation is same 
## rule3:The lift ratio is 2,60 , if he/she will buy {childbks,youthbks,doitybks} and also he/she will buy{refbks}
## rule4: the lift ratio is 2.51 ,if he/she will buy {childbks,youthbks,cookbks,artbks} and also he/she will buy{geogbks}


# Building arule3 using apriori algorithm( the support value 0.06 & confidence =0.8)
arule3=apriori(as.matrix(book),parameter = list(support =0.06,confidence=0.8))
arule3


inspect((sort(arule3,by="lift"))) # Sort the Highest lift ratio in decending order 

## The Top 3 rules are 
#rule1: The highest lift ratio is 2.32 and the conbinations are if he/she will buy {italcook}
######## also he/she will buy {cookbks}
## rule2: The lift ratio for second combiantion also same but combination are if he/she will buy {geogbks,italcook}
###       also he/she will buy {cookbks} 
### rule3: The lift ratio for third combiantion also same but combination are if he/she will buy {childbks,italcook}
###       also he/she will buy {cookbks} and also we can say to Vender/client in above 3 rules combination any one you can take first because lift ratio same for first 3 rules  






# Different Ways of Visualizing Rules
plot(Arules,jitter=0)# to reduce over plotting Jitter is added 
plot(Arules,method="grouped")
plot(Arules[1:20],method = "graph") # only plotting the graph for top best 20 rules 

plot(arule2,jitter=0)# to reduce over plotting Jitter is added
plot(arule2,method="grouped")
plot(arule2[1:40],method = "graph") # only plotting the graph for top best 40 rules 


plot(arule3,jitter=0)# to reduce over plotting Jitter is added
plot(arule3,method="grouped")
plot(arule3[1:10],method = "graph") # only plotting the graph for top best 10 rules 
