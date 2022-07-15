tmt <- read.table(file="Tomato.csv", header = TRUE, sep = ",")
head(tmt)
tail(tmt)
tmt2 <- read.table(file="Tomato.csv", sep = ",")
head(tmt2)
cc <- read.csv(file="california_cities.csv")
head(cc)
names(tmt)
tmt
tmt[order(tmt$Overall),]
tmt[order(tmt$Overall), c(5,6,7,8,9)]
tmt[rev(order(tmt$Overall)),]
summary(tmt)

emp.data <- data.frame(
  emp_id = c (1:8), 
  emp_name = c("Rick","Dan","Michelle","Ryan","Gary","Rasmi","Pranab","Tusar"),
  salary = c(5000,5000,6500,8000,10000,6000,8000,6500), 
  dept = c("IT","Operations","IT","HR","Finance","IT","Operations","Fianance"),
  experience = c(1,1,3,4,5,2,4,3),
  stringsAsFactors = FALSE)		
print(emp.data) 
summary(emp.data)

mean(emp.data$salary)
median(emp.data$salary)
min(emp.data$salary)
max(emp.data$salary)
range(emp.data$salary)
quantile(emp.data$salary)
IQR(emp.data$salary)
var(emp.data$salary)
sd(emp.data$salary)
sapply(emp.data, mean)
sapply(emp.data[,-c(2,4)], quantile)
sapply(emp.data[,c(-2,-4)], quantile)


plot(emp.data$salary, emp.data$experience)
plot(emp.data$salary, emp.data$experience, pch = 21, bg="red")

