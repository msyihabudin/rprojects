filename <- "G:/Personal/_IPB/Semester4/KOM332 Data Mining/LKP/10/post-operative.csv"
dataset <- read.csv(filename, header = TRUE)

#library arules
rules <- apriori(dataset)
rules
quality(rules) <- quality(rules)
inspect(rules)

#rules with rhs containing "Survived" only
rules <- apriori(dataset, parameter = list(minlen=2,supp=0.15,conf=0.8),
                 appearance = list(rhs=c("CLASS=A","CLASS=S","CLASS=I"),
                                   default="lhs"),control = list(verbose=F))
rules.sorted <- sort(rules, by="lift")
inspect(rules.sorted)

# find redundant rules
subset.matrix <- is.subset(rules.sorted, rules.sorted, sparse = FALSE)
subset.matrix[lower.tri(subset.matrix, diag=T)] <- NA
redundant <- colSums(subset.matrix, na.rm=T) >= 1
which(redundant)
