weight <- c(60, 72, 57, 90, 95, 72)
weight

height <- c(1.75, 1.80, 1.65, 1.90, 1.74, 1.91)
bmi <- weight/height^2
bmi
sum(weight)
sum(weight)/length(weight) #average
names <-  c("Huey","Dewey","Louie")
names2 <- c('Huey','Dewey','Louie')
logical <- c(T,T,F,T)
bmi > 25

numbers <- 1:10
numbers
numbers1 <- 1.5:6.5
numbers1
numbers2 <- 1.5:6.3
numbers2

length(names)
length(numbers)

sort(names)
names[1]
names[0]
names[2]
names[3]
names[c(1,3)]
names[c(-1)]
names[1] <- "Jakey"
names

rep(c(1,2,3), each=3)
rep(c(1,2,3), times=3)
rep(c(1,2,3), times = c(5,2,1))
seq(from = 0, to = 100, by = 20)
seq(0,100,20)
