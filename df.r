Names <- c("Minu", "Jinta", "Megha")
Age <- c(25, 24, 23)
d <- data.frame(Names, Age, stringsAsFactors = FALSE)
d
d[1]
d[["Names"]]
d$Names
d[3,2]
d[2,]
d[1:2,]
head(d)
tail(d)
d[d$Age > 24,]
New_DF = rbind(d, list("Emily",26))
New_DF
New_col_DF <- cbind(d, Gender = c("F", "F", "F"))
New_col_DF
dim(d)
dim(New_DF)
dim(New_col_DF)
ncol(d)
length(d)
nrow(New_DF)

Data_Frame <- data.frame (
  Training = c("Strength", "Stamina", "Other"),
  Pulse = c(100, 150, 120),
  Duration = c(60, 30, 45))
Data_Frame_New <- Data_Frame[-c(1), -c(1)]
Data_Frame_New

Data_Frame1 <- data.frame (
  Training = c("Strength", "Stamina", "Other"),
  Pulse = c(100, 150, 120),
  Duration = c(60, 30, 45))
Data_Frame2 <- data.frame (
  Training = c("Stamina", "Stamina", "Strength"),
  Pulse = c(140, 150, 160),
  Duration = c(30, 30, 20))
New_Data_Frame <- rbind(Data_Frame1, Data_Frame2)
New_Data_Frame

Data_Frame3 <- data.frame (
  Training = c("Strength", "Stamina", "Other"),
  Pulse = c(100, 150, 120),
  Duration = c(60, 30, 45))
Data_Frame4 <- data.frame (
  Steps = c(3000, 6000, 2000),
  Calories = c(300, 400, 300))
New_Data_Frame1 <- cbind(Data_Frame3, Data_Frame4)
New_Data_Frame1
