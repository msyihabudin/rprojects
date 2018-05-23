data <- read.csv("G:/Personal/_IPB/Semester4/KOM332 Data Mining/LKP/8/dataset.csv")
data$salary <- as.factor(data$salary)
data$satisfaction_level <- as.integer(data$satisfaction_level)
data$sales <- as.numeric(data$sales)

str(data)

set.seed(1234)
ind <- sample(2, nrow(data), replace = TRUE, prob = c(0.7, 0.3))
trainData <- data[ind==1,]
testData <- data[ind==2,]

library(e1071)
svm.model <- svm(salary ~ ., data = trainData, cost = 100, gamma = 1)
svm.pred <- predict(svm.model, testData[,-10])
table(pred = svm.pred, true = testData[,10])
plot(svm.pred, testData$salary)

#Confusion Matrix
library(caret)
confusionMatrix(svm.pred, testData$salary)
