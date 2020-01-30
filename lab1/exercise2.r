data1 <-read.csv(file.choose(),skip=1)
attach(data1)
GEO_subregion
EPI_regions
EPI_South_Asia <- EPI[GEO_subregion=='South Asia']
E_South_Asia <- EPI_South_Asia [!is.na(EPI_South_Asia)]


summary(E_South_Asia)
fivenum(E_South_Asia,na.rm=TRUE)
stem(E_South_Asia)
hist(E_South_Asia)
hist(E_South_Asia, seq(0., 100., 1.0), prob=TRUE)
lines(density(E_South_Asia,na.rm=TRUE,bw=1.))
rug(E_South_Asia) 


