data1 <- read.csv("G:/Personal/_IPB/Semester4/KOM332 Data Mining/LKP/QUIZ/data1.csv", header = TRUE)
data2 <- read.csv("G:/Personal/_IPB/Semester4/KOM332 Data Mining/LKP/QUIZ/data2.csv", header = TRUE)

#1. Eksplorasi data
str(data1)
str(data2)

md.pattern(data1)
md.pattern(data2)

summary(data1)
summary(data2)

#2. Praproses data
#2.1	penggabungan data secara baris
dataGabung <- rbind(data1, data2)

#2.2	pengisian missing value
dataGabung$A[is.na(dataGabung$A)] <- mean(dataGabung$A, na.rm = TRUE)
dataGabung$B[is.na(dataGabung$B)] <- mean(dataGabung$B, na.rm = TRUE)
dataGabung$C[is.na(dataGabung$C)] <- mean(dataGabung$C, na.rm = TRUE)
dataGabung$D[is.na(dataGabung$D)] <- mean(dataGabung$D, na.rm = TRUE)
dataGabung$E[is.na(dataGabung$E)] <- mean(dataGabung$E, na.rm = TRUE)

#2.3	reduksi data yang diambil sebanyak 200 data dengan ketentuan atribut B>53 dan D>38
dataSyarat<-dataGabung[which(dataGabung$B>53 & dataGabung$D>38),]

dataReduksi<-dataSyarat[sample(1:nrow(dataSyarat),200,replace=FALSE),]

#3. Clustering
#K-Means
dataReduksi2 <- dataReduksi
(kmeans.result <- kmeans(dataReduksi2, 3))
plot(dataReduksi[c("A", "B","C","D","E")], col = kmeans.result$cluster)

#K-Medoids
dataReduksi3 <- dataReduksi
dataReduksi$F <- NULL
pamk.result <- pamk(dataReduksi3)
plot(dataReduksi3[c("A", "B","C","D","E")], col = pamk.result$cluster)