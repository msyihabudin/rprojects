#Decision Tree
str(iris)
set.seed(1234)
ind <- sample(2, nrow(iris), replace = TRUE, prob = c(0.7, 0.3))
trainData <- iris[ind==1,]
testData <- iris[ind==2,]

library(partykit)
modelctree <- ctree(Species ~ . ,data = trainData)
predctree <- predict(modelctree, testData[,-5])
table(predctree, testData$Species)
plot(predctree, testData$Species)

library(rpart)
modelpart <- rpart(Species~., trainData)
predpart <- predict(modelpart, type = "class", testData[,-5])
table(predpart, testData$Species)
plot(predpart)

#SVM
#e1071 library
library(e1071)
svm.model <- svm(Species ~ ., data = trainData, cost = 100, gamma = 1)
svm.pred <- predict(svm.model, testData[,-5])
table(pred = svm.pred, true = testData[,5])
plot(svm.pred, testData$Species)

#tambahan
#Confusion Matrix
library(caret)
confusionMatrix(svm.pred, testData$Species)
