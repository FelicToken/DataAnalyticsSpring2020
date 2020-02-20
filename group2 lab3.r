library(rpart)
library(rpart.plot)
data("msleep")
str(msleep)
help("msleep")

mSleepDF1 <- msleep[,c(3,6,10,11)] 
# 3 = vore,6=sleep_total, 10=brainwt, 11=bodywtstr(data)
str(mSleepDF1)
head(mSleepDF1)
help("rpart")
sleepModel_1 <- rpart(sleep_total ~ ., data=mSleepDF1, method = "anova")
sleepModel_1

help("rpart.plot")
rpart.plot(sleepModel_1, type = 3, fallen.leaves = TRUE)
rpart.plot(sleepModel_1, type = 3,digits = 3, fallen.leaves = TRUE) # with 3 digits
rpart.plot(sleepModel_1, type = 3,digits = 4, fallen.leaves = TRUE)


install.packages("C50")
require(C50)

data("iris")
head(iris)
str(iris)
table(iris$Species)
set.seed(9850)
grn <-runif(nrow(iris))
# creating a randomized iris dataset , shuffling the dataset
# we use the order() function along with the
#random numbers we generated.
irisrand <-iris[order(grn),]
# obsrve that rows are now randomly shuffled.
str(irisrand)
classificationmodel1 <-C5.0(irisrand[1:100,-5],
                            irisrand[1:100,5])
classificationmodel1
summary(classificationmodel1)
# now we will do the prediction using the
#predict() function
# We are using the remaining last 50 rows for
#here starting from 101 row to 150th row
prediction1 <-
  predict(classificationmodel1,irisrand[101:150,])
prediction1
table(irisrand[101:150,5],prediction1)
plot(classificationmodel1)

