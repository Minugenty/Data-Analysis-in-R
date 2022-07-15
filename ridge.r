install.packages("glmnet")
library(glmnet)
set.seed(42)  # Set seed for reproducibility
n <- 1000  # Number of observations
p <- 5000  # Number of predictors included in model
real_p <- 15  # Number of true predictors
## Generate the data
x <- matrix(rnorm(n*p), nrow=n, ncol=p)
y <- apply(x[,1:real_p], 1, sum) + rnorm(n)
train_rows <- sample(1:n, .66*n)
x.train <- x[train_rows, ]
x.test <- x[-train_rows, ]
y.train <- y[train_rows]
y.test <- y[-train_rows]
model <- cv.glmnet(x.train, y.train, type.measure="mse", alpha=0, family="gaussian")
plot(model)
coef(model)
predicted <- predict(model, s=model$lambda.min, newx=x.test)
mean((y.test - predicted)^2)
## s = is the "size" of the penalty, corresponds to lambda. 
##
##     In this case, we set 's' to "lambda.1se", which is
##     the value for lambda that results in the simplest model
##     such that the cross validation error is within one 
##     standard error of the minimum.
##     
##     If we wanted to to specify the lambda that results in the
##     model with the minimum cross valdiation error, not a model
##     within one SE of of the minimum, we would 
##     set 's' to "lambda.min".
##
##     Choice of lambda.1se vs lambda.min boils down to this...
##     Statistically speaking, the cross validation error for 
##     lambda.1se is indistinguisable from the cross validation error
##     for lambda.min, since they are within 1 SE of each other. 
##     So we can pick the simpler model without
##     much risk of severely hindering the ability to accurately
##     predict values for 'y' given values for 'x'.
##
## newx = is the Testing Dataset

## Lastly, let's calculate the Mean Squared Error (MSE) for the model
## created for alpha = 0.
## The MSE is the mean of the sum of the squared difference between 
## the predicted 'y' values and the true 'y' values in the 
## Testing dataset...
lrmodel = lm(y.train ~ x.train, data = data.frame(cbind(x.train,y.train)))
p2 = predict(lrmodel, newdata = data.frame(x.test))
mean((y.test - p2)^2)

