#Hierarchical Clustering
data <- read.csv("G:/Personal/_IPB/Semester4/KOM332 Data Mining/LKP/6/data1.csv")
summary(data)

#mengisi nilai mean untuk missing value
data$X0.455[is.na(data$X0.455)] <- mean(data$X0.455, na.rm = TRUE)
data$X0.365[is.na(data$X0.365)] <- mean(data$X0.365, na.rm = TRUE)
data$X0.095[is.na(data$X0.095)] <- mean(data$X0.095, na.rm = TRUE)
data$X[is.na(data$X)] <- mean(data$X, na.rm = TRUE)
data$X0.2245[is.na(data$X0.2245)] <- mean(data$X0.2245, na.rm = TRUE)
data$X0.101[is.na(data$X0.101)] <- mean(data$X0.101, na.rm = TRUE)
data$X0.15[is.na(data$X0.15)] <- mean(data$X0.15, na.rm = TRUE)
data$X15[is.na(data$X15)] <- mean(data$X15, na.rm = TRUE)

#sample
idx <- sample(1:dim(data)[1], 40)
dataSample <- data[idx,]
dataSample$M <- NULL

#metode average
hc <- hclust(dist(dataSample), method = "ave")
plot(hc, hang = -1, labels = data$M[idx])

#metode complete
hc2 <- hclust(dist(dataSample), method = "com")
plot(hc2, hang = -1, labels = data$M[idx])

#metode single
hc3 <- hclust(dist(dataSample), method = "sin")
plot(hc3, hang = -1, labels = data$M[idx])