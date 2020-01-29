
data1 <-read.csv(file.choose(),skip=1)
attach(data1)
DALY
tf <- is.na(DALY) 
E <- DALY[!tf]


summary(DALY)
fivenum(DALY,na.rm=TRUE)
stem(DALY)
hist(DALY)
hist(DALY, seq(0., 100., 1.0), prob=TRUE)
lines(density(DALY,na.rm=TRUE,bw=1.))
rug(DALY) 


plot(ecdf(DALY), do.points=FALSE, verticals=TRUE) 
par(pty="s") 
qqnorm(DALY); qqline(DALY)

x<-seq(30,95,1)
qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for t dsn")
qqline(x)


boxplot(EPI,DALY) 

#try to exploring the WATER_H
WATER_H
tf <- is.na(WATER_H) 
E <- WATER_H[!tf]


summary(WATER_H)
fivenum(WATER_H,na.rm=TRUE)
stem(WATER_H)
hist(WATER_H)
hist(WATER_H, seq(0., 100., 1.0), prob=TRUE)
lines(density(WATER_H,na.rm=TRUE,bw=1.))
rug(WATER_H) 


plot(ecdf(WATER_H), do.points=FALSE, verticals=TRUE) 
par(pty="s") 
qqnorm(WATER_H); qqline(WATER_H)

x<-seq(30,95,1)
qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for t dsn")
qqline(x)


boxplot(EPI,WATER_H) 


