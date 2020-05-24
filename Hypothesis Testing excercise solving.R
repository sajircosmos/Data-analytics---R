colnames(labtat)=c("laboratory1","laboratory2","laboratory3","laboratory4")
# changing column names 
attach(labtat)
####Anova Test #######
shapiro.test(laboratory1)
#  H0= Lab reports is in Normal,Ha= Lab Reports is not in Normal
# p value is 0.5508,p>0.05, P is high null fly, Accpet null hypothesis, What null hypothesis says Laboratory1 data is normal
shapiro.test(laboratory2)
#  p value is 0.8637,p>0.05, P is high null fly, Accpet null hypothesis, What null hypothesis says Laboratory1 data is normal
shapiro.test(laboratory3)
#p value is 0.4205,p>0.05, P is high null fly, Accpet null hypothesis, What null hypothesis says Laboratory1 data is normal
shapiro.test(laboratory4)
# p value is 0.6619,p>0.05, P is high null fly, Accpet null hypothesis, What null hypothesis says Laboratory1 data is normal
# hence all the above 4 laboratory reports data statistically proved that normally distributed
# so next step is check the variance test , whether variances are equal or not 
Stacked_Data= stack(labtat)
View(Stacked_Data)
attach(Stacked_Data)
bartlett.test(values~ind, data=Stacked_Data) #test for homogeneity of variances
Anova_results=aov(values~ind,data = Stacked_Data)
summary(Anova_results)
# P value=0.1069,p>0.05,P high Null fly , accept null hypothesis , what null hypothesis says "Average turn around time of all 4 laboratories are same"
#######CONCLUSION: Hence statistically Proved that Average turn around time of all 4 laboratories are same.






# Determine whether any difference of cutlet diameters of two units checking by hypothesis
colnames(Cutlets)=c("unitA","unitB")# Changing column names 
# first check the data is normally distributed or not by using normality test 
attach(Cutlets)
shapiro.test(unitA)
# P= 0.32,P>0.05, P high Null fly, Accept Null Hypothesis , what Null hypothesis says "UnitA data is normal ", hnce Statistically Proved
shapiro.test(unitB)
# P= 0.32,P>0.05, P high Null fly, Accept Null Hypothesis , what Null hypothesis says "UnitA data is normal ", hnce Statistically Proved

# variance test 
#H0=(Variance)unitA=(Variance)unitB
#(Variance)unita=!(variance)unitB
var.test(unitA,unitB)
# p=0.3136,p>0.05,P high Null fly , Accept Null Hypothesis, what Null Hypothesus says is Variance of unitA = variance Of unitB

##### 2 sample T Test ##########
# H0=(mean)unitA = (mean)UnitB
# Ha=(Mean)unitA =!(Mean)UnitB
t.test(unitA,unitB,alternative = "two.sided",conf.level = 0.95,correct = TRUE)
#alternative = "two.sided" means we are checking for equal and unequal
# P=0.4723,P>0.05,P High Null Fly, Accept Null hypothesis , what Null hypothesis says "(Mean)UnitA = (Mean)UnitB
#######  CONCLUSION: Hence Statistically Proved That  Cutlet diameters Of Both Unit A & unit B are Equal There Is No Difference like this we will say to the Managers

###help("t.test") # T Test Document We will get if any doubts 










######Fantaloons Sales managers commented that % of males versus females walking in to the store differ based on day of the week
attach(Faltoons)
help("prop.test")
table2=table(Weekdays,Weekend)
table2
prop.test(x=c(66,47),n=c(167,120),conf.level = 0.95,correct = FALSE,alternative = "two.sided")
# Two sided means that checking for equal proportions of male and female under weekdaysand weekends
# p = 0.9517,p>0.05, P high Null fly, Acccept Null hypothesis, what null Hypothesis says is "equal Proportions"
#### CONCLUSION : sales manager commit to start fantaloons sales at weekends and weekdays both , why Because Both The days sales with respect to male Vs Female is equal Proportions, statistically proved








######## Chi squre Test (costomerorderform)############
## Ho=Errors Involved all the Centers are equal 
## Ha= Atleast One Differ 
head(costomerorderform)
tail(costomerorderform)
attach(costomerorderform)
View(costomerorderform)
summary(costomerorderform)
pp=table(subscripts,defective)
pp
chisq.test(subscripts,defective)
## P vlue is 0.2771 which is greater than 0.05 so P high Null fly accept Null Hypothesis
### What Null Hypothesis says is Errors Involved All The centers are Equal ,Hence Statistically Proved Also







######## Chi square test (Buyers ratio)#######
head(buyersratio)
attach(buyersratio)
ll=table(Observed.Values,East,West,North,South)
print(ll)
# H0= All the Averages are Equal
# Ha= Atleast One Is different From Other 
chisq.test(Observed.Values,East,West,North,South)
 # Here P Value is >0.05 (i,e 1) so P High null fly, accept Null hypothesis what Null hypothesis says is
##### Proportion Of buyersratio Across all the Regions Should Be Same Statistically Proved #####
