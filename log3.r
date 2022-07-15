polling <- read.csv("PollingData_Imputed.csv")
Train <- subset(polling, Year== 2004 | Year == 2008)
Test <- subset(polling, Year == 2012)
#Naive Baseline
table(Train$Republican)
#Smarter Baseline
table(sign(Train$Rasmussen))
table(Train$Republican, sign(Train$Rasmussen))

#Checking Multicollinearity
cor(Train[c("Rasmussen", "SurveyUSA", "PropR", "DiffCount", "Republican")])

mod1 <- glm(Republican ~ PropR, data = Train, family = "binomial")
summary(mod1)
pred1 <- predict(mod1, type="response")
table(Train$Republican, pred1 >=0.5)

mod2 <- glm(Republican ~ SurveyUSA + DiffCount, data = Train, family = "binomial")
summary(mod2)
pred2 <- predict(mod2, type="response")
table(Train$Republican, pred2 >=0.5)

#Test Data set
#Smarter Baseline
table(Test$Republican, sign(Test$Rasmussen))

#Two var model
TestPrediction <- predict(mod2, newdata= Test, type="response")
table(Test$Republican, TestPrediction >=0.5)

subset(Test, TestPrediction >= 0.5 & Republican == 0)
