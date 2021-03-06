dataset <- read.csv("framingham.csv")
str(dataset) #structure
library(caTools)
set.seed(88)
split <- sample.split(dataset$TenYearCHD, SplitRatio = 0.65)
Train <- subset(dataset, split == TRUE)
Test <- subset(dataset, split == FALSE)
LogModel <- glm(TenYearCHD ~ ., data = Train, family = binomial)
summary(LogModel)
predictTest <- predict(LogModel, type="response", newdata=Test)
table(Test$TenYearCHD, predictTest > 0.5)
ModelAcc <- (1056 + 12)/(1056+12+185+5)
ModelAcc
BAcc <- (1056+5)/(1056+12+185+5)
BAcc
library(ROCR)
ROCRPred = prediction(predictTest, Test$TenYearCHD)
ROCRperf = performance(ROCRPred, "tpr", "fpr")
plot(ROCRperf, colorize = TRUE, print.cutoffs.at = seq(0,1,0.1), text.adj = c(-0.2,1.7))
AUC <- as.numeric(performance(ROCRPred, "auc")@y.values)
