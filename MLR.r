wine = read.csv("wine.csv")
str(wine)
summary(wine)

model1 = lm(Price ~ AGST, data=wine)
summary(model1)
SSE = sum(model1$residuals^2)
SSE

model2 = lm(Price ~ AGST + HarvestRain, data=wine)
summary(model2)
SSE = sum(model2$residuals^2)
SSE

model3 = lm(Price ~ AGST + HarvestRain + WinterRain + Age + FrancePop, data=wine)
summary(model3)
SSE = sum(model3$residuals^2)
SSE

# Remove FrancePop
model4 = lm(Price ~ AGST + HarvestRain + WinterRain + Age, data=wine)
summary(model4)
plot(wine$WinterRain, wine$Price)
cor(wine$WinterRain, wine$Price)
plot(wine$HarvestRain, wine$AGST)
plot(wine$Age, wine$FrancePop)
cor(wine$Age, wine$FrancePop)
cor(wine)

# Remove Age and FrancePop
model5 = lm(Price ~ AGST + HarvestRain + WinterRain, data=wine)
summary(model5)

wineTest = read.csv("wine_test.csv")
str(wineTest)
predictTest = predict(model4, newdata=wineTest)
predictTest
# Compute R-squared
SSE = sum((wineTest$Price - predictTest)^2)
SST = sum((wineTest$Price - mean(wine$Price))^2)
1 - SSE/SST