install.packages('dplyr')
library(dplyr)
library(ggplot2)
#read in the csv file
LifeExpectancy <- read.csv(file.choose())
head(LifeExpectancy)
attach(LifeExpectancy)

CHE<-read.csv(file.choose())
head(CHE)
attach(CHE)

pol3<-read.csv(file.choose(),skip=1)
head(pol3)
attach(pol3)

DTP3<-read.csv(file.choose(),skip=1)
head(DTP3)
attach(DTP3)
#filter the data to clear the data from country named Rwanda since there are chuck of incorrect data
LifeExpectancy <- LifeExpectancy %>%filter(COUNTRY != "Rwanda") 
LifeExpectancy


#datacleanning for CHE,hepB3 and DTP3
CHE<- na.omit(CHE)
pol3<-na.omit(pol3)
DTP3<-na.omit(DTP3)

#prepare to EDA about the life expectancy
#lifeExpectancy at 2000
Expectancy2000F<-LifeExpectancy %>% filter(YEAR==2000)%>%filter(SEX=='Female')
Expectancy2000M<-LifeExpectancy %>% filter(YEAR==2000)%>%filter(SEX=='Male')
hist(Expectancy2000F$Display.Value)
hist(Expectancy2000M$Display.Value)
summary(Expectancy2000F) 
summary(Expectancy2000M)

#lifeExpectancy at 2016
Expectancy2016F<-LifeExpectancy %>% filter(YEAR==2016)%>%filter(SEX=='Female')
Expectancy2016M<-LifeExpectancy %>% filter(YEAR==2016)%>%filter(SEX=='Male')
hist(Expectancy2016F$Display.Value)
hist(Expectancy2016M$Display.Value)
summary(Expectancy2016F)
summary(Expectancy2016M)

#eda about CHE
ggplot(data = CHE, mapping = aes(x=CHE$X2016)) + geom_freqpoly(binwidth= 0.1)
ggplot(data = CHE, mapping = aes(x=CHE$X2000)) + geom_freqpoly(binwidth= 0.1)

#EDA about pol3
ggplot(data = pol3, mapping = aes(x=pol3$X2016)) + geom_freqpoly(binwidth= 0.1)
ggplot(data = pol3, mapping = aes(x=pol3$X2000)) + geom_freqpoly(binwidth= 0.1)

#EDA about DTP3
ggplot(data = DTP3, mapping = aes(x=DTP3$X2016)) + geom_freqpoly(binwidth= 0.1)
ggplot(data = DTP3, mapping = aes(x=DTP3$X2000)) + geom_freqpoly(binwidth= 0.1)


#regression
Expectancy2016<-LifeExpectancy %>% filter(YEAR==2016)%>%filter(SEX=='Both sexes')
total<-merge(Expectancy2016,CHE,by="COUNTRY")
total<-merge(total,DTP3,by="COUNTRY")
total<-merge(total,pol3,by="COUNTRY")
fit1<-lm(total$Display.Value~total$CHE2016+total$DTP32016+total$X2016)
summary(fit1)
plot(fit1)
fit1<-lm(total$Display.Value~total$CHE2016)
summary(fit1)
fit1<-lm(total$Display.Value~total$DTP32016)
summary(fit1)
fit1<-lm(total$Display.Value~total$X2016)
summary(fit1)

Expectancy2000<-LifeExpectancy %>% filter(YEAR==2000)%>%filter(SEX=='Both sexes')
total2<-merge(Expectancy2000,CHE,by="COUNTRY")
total2<-merge(total2,DTP3,by="COUNTRY")
total2<-merge(total2,pol3,by="COUNTRY")
fit2<-lm(total2$Display.Value~total$CHE2000+total$DTP32000+total$X2000)
summary(fit2)
plot(fit2)
fit2<-lm(total2$Display.Value~total2$CHE2000)
summary(fit2)
fit2<-lm(total2$Display.Value~total2$X2000)
summary(fit2)
fit2<-lm(total2$Display.Value~total2$DTP32000)
summary(fit2)
#use kmean clustering to find out country that has high life expectancy
ExpectancyF<-LifeExpectancy %>%filter(SEX=='Female')
ExpectancyM<-LifeExpectancy %>%filter(SEX=='Male')
ggplot(ExpectancyF, aes(ExpectancyF$YEAR, ExpectancyF$Display.Value, color = ExpectancyF$REGION)) + geom_point()
ggplot(ExpectancyM, aes(ExpectancyM$YEAR, ExpectancyM$Display.Value, color = ExpectancyM$REGION)) + geom_point()
ExpectancyF.feature<-ExpectancyF
ExpectancyF.feature$REGION=NULL
ExpectancyF.feature$COUNTRY=NULL
ExpectancyF.feature$SEX=NULL
FemaleClustering<-kmeans(ExpectancyF.feature,6)
ExpectancyM.feature<-ExpectancyM
ExpectancyM.feature$REGION=NULL
ExpectancyM.feature$COUNTRY=NULL
ExpectancyM.feature$SEX=NULL
MaleClustering<-kmeans(ExpectancyM.feature,6)
table(ExpectancyF$REGION,FemaleClustering$cluster)
table(ExpectancyM$REGION,MaleClustering$cluster)
ggplot(ExpectancyF, aes(ExpectancyF$YEAR, ExpectancyF$Display.Value, color = FemaleClustering$cluster)) + geom_point()
ggplot(ExpectancyM, aes(ExpectancyM$YEAR, ExpectancyM$Display.Value, color = MaleClustering$cluster)) + geom_point()
