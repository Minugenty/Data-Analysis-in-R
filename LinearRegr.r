x <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131)
y <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)
plot(x,y)
# Apply the lm() function.
relation <- lm(y~x)

print(relation)
print(summary(relation))
a <- data.frame(x = 170)
result <-  predict(relation,a)
print(result)

plot(x,y,col = "blue",main = "Height & Weight Regression",
     abline(lm(y~x)),cex = 1.3,pch = 16,xlab = "Height in cm",ylab = "Weight in kg")