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

multivariate <- read.csv(file.choose(),header=TRUE)
attach(multivariate)
mm<-lm(Homeowners~Immigrant)
summary(mm)$coef
plot(Homeowners~Immigrant)
help(abline)
abline(mm)
abline(mm,col=3,lwd=3) # line color = green, line width = 3
attributes(mm)
mm$coefficients

