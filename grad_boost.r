library(MASS)
str(Boston)
library(caTools)
set.seed(123)
split = sample.split(Boston$medv, SplitRatio = 0.7)
train = subset(Boston, split==TRUE)
test = subset(Boston, split==FALSE)

#install.packages("gbm")
library(gbm)
Boston.boost = gbm(medv ~ . ,data = train, distribution = "gaussian", 
                 n.trees = 10000,shrinkage = 0.01, interaction.depth = 4)
Boston.boost
summary(Boston.boost) 

n.trees = seq(from=100 ,to=10000, by=100) 
predmatrix<-predict(Boston.boost, train, n.trees = n.trees)
dim(predmatrix) 

#Calculating The Mean squared Test Error
test.error<-with(train, apply((predmatrix-medv)^2,2,mean))
head(test.error) 

plot(n.trees , test.error , pch=19,col="blue",
     xlab="Number of Trees",ylab="Test Error", 
     main = "Perfomance of Boosting on Test Set")
