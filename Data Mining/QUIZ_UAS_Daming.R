dt <- read.csv("G:/Personal/_IPB/Semester4/KOM332 Data Mining/LKP/QUIZ_UAS/ganjil.csv", header = TRUE)

#1. Eksplorasi data
str(dt)
summary(dt)

#2. Klasifikasi data
#A. Lakukan pembagian data secara acak dengan proporsi data latih sebanyak 80% dan data uji 20%
set.seed(1234)
ind <- sample(2, nrow(dt), replace = TRUE, prob = c(0.8, 0.2))
trainData <- dt[ind==1,]
testData <- dt[ind==2,]

#B.	Lakukan klasifikasi menggunakan decision tree dengan data latih dan data uji yang sudah dibagi
library(rpart)
modelpart <- rpart(class~., trainData)
predpart <- predict(modelpart, type = "class", testData[,-7])
table(predpart, testData$class)
plot(predpart)

#C.	Jelaskan confusion matrix dari hasil klasifikasi
library(caret)
confusionMatrix(predpart, testData$class)
