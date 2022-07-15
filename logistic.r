quality <- read.csv("quality.csv")
str(quality) #structure
table(quality$PoorCare)
#98 recieved good care
98/131 #Accuracy of baseline model
#Since good care is more common
library(caTools)
set.seed(88)
split <- sample.split(quality$PoorCare, SplitRatio = 0.75)
split
qualityTrain <- subset(quality, split == TRUE)
qualityTest <- subset(quality, split == FALSE)
nrow(qualityTrain)
nrow(qualityTest)
QualityLog <- glm(PoorCare ~ OfficeVisits + Narcotics, data = qualityTrain, family = binomial)
#family = binomial means --- logistic regression
summary(QualityLog)
#AIC should be minimum
predictTrain <- predict(QualityLog, type="response")
#type="response" will predict a probability
summary(predictTrain)
tapply(predictTrain, qualityTrain$PoorCare, mean)




table(qualityTrain$PoorCare, predictTrain > 0.5)
Sensitivity <- 10/25
Specificity <- 70/74
table(qualityTrain$PoorCare, predictTrain > 0.7)
#again compute specificity & specificity
table(qualityTrain$PoorCare, predictTrain > 0.2)
#again compute specificity & specificity
#lower threshold, large Sensitivity

#Generate ROC curve
#install.packages("ROCR")
library(ROCR)
ROCRPred = prediction(predictTrain, qualityTrain$PoorCare)
ROCRperf = performance(ROCRPred, "tpr", "fpr")
plot(ROCRperf)
plot(ROCRperf, colorize = TRUE)
plot(ROCRperf, colorize = TRUE, print.cutoffs.at = seq(0,1,0.1), text.adj = c(-0.2,1.7))

predictTest <- predict(QualityLog, type="response", newdata=qualityTest)
table(qualityTest$PoorCare, predictTest > 0.5)
accuracy <- (23 + 3)/(23+3+1+5)
#Baseline Accuracy = Frequent case =0 / N
BAcc <- (23+1)/(23+1+3+5)
ROCRPred <- prediction(predictTest, qualityTest$PoorCare)
AUC <- as.numeric(performance(ROCRPred, "auc")@y.values)
