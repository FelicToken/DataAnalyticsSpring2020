
data1 <-read.csv(file.choose(),header=TRUE)
attach(data1)
fix(data1) 
EPI
tf <- is.na(EPI) 
E <- EPI[!tf]


summary(DALY)
fivenum(DALY,na.rm=TRUE)
stem(DALY)
hist(DALY)
hist(DALY, seq(0., 100., 1.0), prob=TRUE)
lines(density(DALY,na.rm=TRUE,bw=1.))
rug(DALY) 


plot(ecdf(EPI), do.points=FALSE, verticals=TRUE) 
par(pty="s") 
qqnorm(EPI); qqline(EPI)

x<-seq(30,95,1)
qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for t dsn")
qqline(x)


boxplot(EPI,DALY) 

