z <- c(1, 2, NA, 8, 3, NA, 3)
z
is.na(z)
z <- c(1, NULL, 3)
z
#Imputation
custdata <- read.csv('custdata.csv')
summary(custdata[is.na(custdata$housing.type),
                 c("recent.move","num.vehicles")])
#MISSING DATA IN CATEGORICAL VARIABLE
summary(custdata)
custdata$is.employed.fix <- ifelse(is.na(custdata$is.employed),"missing",
                                   ifelse(custdata$is.employed==T,
                                          "employed","not employed"))
summary(as.factor(custdata$is.employed.fix))

#MISSING VALUES IN NUMERIC DATA
summary(custdata$income)
#WHEN VALUES ARE MISSING RANDOMLY
meanIncome <- mean(custdata$income, na.rm=T)
custdata$Income.fix <- ifelse(is.na(custdata$income),
                       meanIncome, custdata$income)
summary(custdata$Income.fix)
#MICE
polling <- read.csv("PollingData.csv")
str(polling)
table(polling$Year)
summary(polling)
#install.packages("mice")
library(mice)
simple <- polling[c("Rasmussen", "SurveyUSA", "PropR", "DiffCount")]
summary(simple)

set.seed(144)
imputed <- complete(mice(simple))
summary(imputed)

polling$Rasmussen <- imputed$Rasmussen
polling$SurveyUSA <- imputed$SurveyUSA
summary(polling)
