library(dplyr)
df_mtcars<-mtcars
head(df_mtcars)

#nesting
filter(df_mtcars,mpg>20)
#we want to get 10 samples of that 
sample_n(filter(df_mtcars,mpg>20),10)
#now try to arrange them into descending order based on the mpg
arrange(sample_n(filter(df_mtcars,mpg>20),10),desc(mpg))
#assign
result_mpg<-arrange(sample_n(filter(df_mtcars,mpg>20),10),desc(mpg))
result_mpg

#method 2
a1<-filter(df_mtcars,mpg>20)
a2<-sample_n(a1,10)
result_mpg_desc<-arrange(a2,desc(mpg))
result_mpg_desc

#method 3
df_mtcars %>% filter(mpg>20) %>% sample_n(5) %>% arrange(desc(mpg))
result<-df_mtcars %>% filter(mpg>20) %>% sample_n(5) %>% arrange(desc(mpg))

