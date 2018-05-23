###############################ASSOCIATION RULE MINING#########################

df<-as.data.frame(Titanic)
titanic.raw <- NULL
for(i in 1:4) { titanic.raw <- cbind(titanic.raw,rep(as.character(df[,i]), df$Freq))}
titanic.raw <- as.data.frame(titanic.raw)
names(titanic.raw) <- names(df)[1:4]
summary(titanic.raw)

#library arules
rules <- apriori(titanic.raw)
rules
quality(rules) <- quality(rules)
inspect(rules)


# rules with rhs containing "Survived" only
rules <- apriori(titanic.raw, parameter = list(minlen=3,supp=0.005, conf=0.8), 
                 appearance = list(rhs=c("Survived=No","Survived=Yes"), 
                                   default="lhs"), control = list(verbose=F))
rules.sorted <- sort(rules, by="lift")
inspect(rules.sorted)


# find redundant rules
subset.matrix <- is.subset(rules.sorted, rules.sorted)
#subset.matrix[lower.tri(subset.matrix, diag=T)] <- NA
redundant <- colSums(subset.matrix, na.rm=T) >= 1
which(redundant)

# remove redundant rules
rules.pruned <- rules.sorted[!redundant]
inspect(rules.pruned)

# interpretating rules
rules <- apriori(titanic.raw, parameter = list(minlen=3,supp=0.002, conf=0.2), appearance = list(rhs=c("Survived=Yes"),lhs=c("Class=1st", "Class=2nd", "Class=3rd", "Age=Child","Age=Adult"), default="none"), control = list(verbose=F))
rules.sorted <- sort(rules, by="confidence")
inspect(rules.sorted)

#library arulesviz
plot(rules)
plot(rules, method ="grouped")
plot(rules, method="graph")
plot(rules, method="graph", control= list(type="items"))
plot(rules, method = "graph", control = list(verbose = TRUE))