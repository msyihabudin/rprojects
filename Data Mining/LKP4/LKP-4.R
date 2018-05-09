data <- read.csv("G:/Personal/_IPB/Semester4/KOM332 Data Mining/LKP/4/forestfires.csv")
str(data)

md.pattern(data)
summary(data)

#X
data$X[is.na(data$X)] <- mean(data$X, na.rm = TRUE)
#Y
data$Y[is.na(data$Y)] <- mean(data$Y, na.rm = TRUE)
#month
summary(data$month)
data$month[data$month == ""] <- "aug"
#day
summary(data$day)
data$day[data$day == ""] <- "sun"
#FFMC
data$FFMC[is.na(data$FFMC)] <- mean(data$FFMC, na.rm = TRUE)
#DMC
data$DMC[is.na(data$DMC)] <- mean(data$DMC, na.rm = TRUE)
#DC
data$DC[is.na(data$DC)] <- mean(data$DC, na.rm = TRUE)
#ISI
data$ISI[is.na(data$ISI)] <- mean(data$ISI, na.rm = TRUE)
#temp
data$temp[is.na(data$temp)] <- mean(data$temp, na.rm = TRUE)
#RH
data$RH[is.na(data$RH)] <- mean(data$RH, na.rm = TRUE)
#wind
data$wind[is.na(data$wind)] <- mean(data$wind, na.rm = TRUE)
#rain
data$rain[is.na(data$rain)] <- mean(data$rain, na.rm = TRUE)
#area
data$area[is.na(data$area)] <- mean(data$area, na.rm = TRUE)
