grocery <- read.csv("D:/excelR/Dataset/Grocery.csv")
View(grocery)
library(arules)
library(arulesViz)
str(grocery) # we can check the data type 
# Building rules by using the apriori algorithm(support=0.006 and confidence=0.7)
arules1=apriori(grocery,parameter =list(support=0.006,confidence = 0.7))
arules1 # set of 115 rules 

inspect(sort(arules1,by="lift"))# Sort the Highest lift ratio in decending order 

## The Top 6 rules and the lift ratio highest is 26.37 and the combination is if he/she will buy {semi.finished.bread=sausage}and also he/she will buy  {citrus.fruit=frankfurter} 
## rule2: the lift ratio is 4.388 ,if he/she will buy  {citrus.fruit=shopping bags}  and also he/she will buy {semi.finished.bread=} 
## rule3: lift ratio 4.38   conbinations  {citrus.fruit=shopping bags,margarine=}   &     {semi.finished.bread=}                                                                     
## rule4: lift ratio 4.38    conbinations {citrus.fruit=shopping bags,ready.soups=} &      {semi.finished.bread=}                                                                        
## rule5: lift ratio 4.38     conbinations   {citrus.fruit=shopping bags,margarine=,ready.soups=} &   {semi.finished.bread=}                                                                           
## we can say  to vender/client 3,4,5 has same lift ratio but combinations different so you can take which one you want ......                                                                                      


# Building rules by using the apriori algorithm(support=0.004 and confidence=0.8)
arules2=apriori(grocery,parameter =list(support=0.004,confidence = 0.8))
arules2 # set of 140 rules 

inspect(sort(arules2,by="lift"))# Sort the Highest lift ratio in decending order 


# Building rules by using the apriori algorithm(support=0.008 and confidence=0.8)
arules3=apriori(grocery,parameter =list(support=0.008,confidence = 0.8))
arules3

inspect(sort(arules3,by="lift"))


# Different Ways of Visualizing Rules
plot(arules1,jitter=0)# to reduce over plotting Jitter is added 
plot(arules1,method="grouped")
plot(arules1[1:6],method = "graph") # only plotting the graph for top best 6 rules

plot(arules2,jitter=0)# to reduce over plotting Jitter is added
plot(arules2,method="grouped")
plot(arules2[1:40],method = "graph") # only plotting the graph for top best 40 rules

plot(arules3,jitter=0)# to reduce over plotting Jitter is added
plot(arules3,method="grouped")
plot(arules3[1:50],method = "graph") # only plotting the graph for top best 50 rules
