filename <- "G:/Personal/_IPB/Semester4/KOM332 Data Mining/Project/data.csv"
dataset <- read.csv(filename, header=TRUE)
dataset <- data.frame(dataset)

#ubah data missing value yang tadinya "?" jadi "NA"
dataset[dataset=="?"]<-NA
summary(dataset)
str(dataset)

5#isi missing value dengan metode modus
Mode <- function (x, na.rm) {
  xtab <- table(x)
  xmode <- names(which(xtab == max(xtab)))
  if (length(xmode) > 1) xmode <- ">1 mode"
  return(xmode)
}

for (var in 1:ncol(dataset)) {
  if (class(dataset[,var])=="numeric") {
    df_test[is.na(dataset[,var]),var] <- mean(dataset[,var], na.rm = TRUE)
  } else if (class(dataset[,var]) %in% c("character", "factor")) {
    dataset[is.na(dataset[,var]),var] <- Mode(dataset[,var], na.rm = TRUE)
  }
}
summary(dataset)
write.csv(dataset, file = "G:/Personal/_IPB/Semester4/KOM332 Data Mining/Project/mushroom_nonNA.csv")
filename <- "G:/Personal/_IPB/Semester4/KOM332 Data Mining/Project/mushroom_nonNA.csv"
dataset <- read.csv(filename, header=TRUE)
dataset1 <- data.frame(dataset)


library(party)
cf1 <- cforest(classes ~ . , data= dataset1[,2:24], control=cforest_unbiased(mtry=2,ntree=50))
#varimp(cf1)

sort(varimp(cf1))
plot(cf1)


# ensure the results are repeatable
set.seed(7)
# load the library
library(mlbench)
library(caret)

# define the control using a random forest selection function
control <- rfeControl(functions=rfFuncs, method="cv", number=50)
# run the RFE algorithm
results <- rfe(dataset1[,3:24], dataset1[,2],rfeControl=control)
print(results, top=10)
predictors(results)
head(results$resample, 10)
# summarize the results
print(results)
# list the chosen features
predictors(results)
# plot the results
plot(results, type=c("g", "o"))


#Install and load Boruta package
install.packages("Boruta")
library(Boruta)

# Run Boruta Algorithm
set.seed(456)
boruta <- Boruta(classes~., data = dataset1[,2:24], doTrace = 50)
print(boruta)
plot(boruta)

plot(boruta, xlab = "", xaxt = "n")
k <-lapply(1:ncol(boruta$ImpHistory),function(i)
  boruta$ImpHistory[is.finite(boruta$ImpHistory[,i]),i])
names(k) <- colnames(boruta$ImpHistory)
Labels <- sort(sapply(k,median))
axis(side = 1,las=2,labels = names(Labels),
     at = 1:ncol(boruta$ImpHistory), cex.axis = 0.7)