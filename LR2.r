mtcars <- read.csv("mtcars.csv")
head(mtcars)
attach(mtcars)
wt
mpg
x <- mtcars$wt
y <- mtcars$mpg

detach(mtcars)
plot(x, y, main = "Weight explaining MPG",
     xlab = "Weight (1000 lbs)", 
     ylab = "Miles Per Gallon")
abline(lm(y ~ x, data = mtcars), col = "blue")
cor(x,y)
LR_mpg <- lm(mpg ~ wt, data = mtcars)
unseen <- data.frame(wt = 4)
predict(LR_mpg, unseen)

print(LR_mpg)
print(summary(LR_mpg))


cars <- read.csv("mtcars.csv")
head(cars)
summary(cars)
