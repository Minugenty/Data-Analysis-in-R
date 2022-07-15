raw_data <- read.csv("Salary_Data.csv")
head(raw_data)
install.packages('caTools')
library(caTools)

set.seed(123)
split = sample.split(raw_data$Salary, SplitRatio = 2/3)
training_set <- subset(raw_data, split == TRUE)
test_set <- subset(raw_data, split == FALSE)
print(training_set)
print(test_set)
regressor = lm(formula = Salary ~ YearsExperience, data = training_set)
print(summary(regressor))
y_pred = predict(regressor, newdata = test_set)
print(y_pred)

plot(raw_data$YearsExperience, raw_data$Salary, 
     main = "Salary vs Experience",
     xlab = "Experience in years", 
     ylab = "Salary")
abline(lm(Salary ~ YearsExperience, data = raw_data), col = "blue")

#SSE - sum(actual - predicted^2)
SSE <- sum(regressor$residuals^2)
#SSR - sum(predicted - ybar^2)
ybar <- mean(raw_data$Salary)
SSR <- sum((regressor$fitted.values-ybar)^2)
#SST - sum((y - ybar)^2) / SSE+SSR
SST <- SSE+SSR
#Residual Standard Error sqrt(SSE/n-q)
#n = no. of obs; q = no. of variables(x & y) 
RSE <- sqrt(SSE/(nrow(raw_data)-length(raw_data)))
#RMSE - root mean square error - sqrt(MSE)
rmse <- sqrt(mean(regressor$residuals^2))
#Coefficient of determination
#multiple R-squared
#SSR/SST or 1-SSE/SST
mr.sq <- 1-(SSE/SST)
mr.sq2 <- SSR/SST
#adj.R-square
#1-((SSE/n-q)/(SST/n-1))
adr.sq <- 1-((SSE/(nrow(raw_data)-length(raw_data)))/(SST/(nrow(raw_data)-1)))
