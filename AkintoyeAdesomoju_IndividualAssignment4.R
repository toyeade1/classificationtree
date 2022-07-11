# Akintoye Adesomoju Individual Assignment 4
# Preset working directory in order to access auction csv file
install.packages('rpart')
install.packages('rpart.plot')
install.packages('gmodels')
install.packages('caret')
library(rpart)
library(rpart.plot)
library(gmodels)
library(caret)
eBay.df <- read.csv('eBayAuctions.csv')

# create df with categorical tables removed
newEbay.df <- eBay.df[, !names(eBay.df) %in% c('Category', 'Currency', 'EndDay')]

#set seed for reference
set.seed(1)

# split the df into a training and validation set. 60/40 ratio
train.index <- sample(c(1:dim(newEbay.df)[1]), dim(newEbay.df)[1]*0.6)
train.df <- newEbay.df[train.index, ]
valid.df <- newEbay.df[-train.index, ]

# create a classification tree model using the competitive column as the responce variable
classification.tree <- rpart(Competitive ~ ., data = newEbay.df, control = rpart.control(maxdepth = 6), method = 'class')
summary(classification.tree)

# plot the created model using the green, yellow and red pallette
prp(classification.tree, type = 4, extra = 101, box.palette = "GnYlRd", 
    fallen.leaves = TRUE, branch = .3, split.font = 1, varlen = -10, 
    under=TRUE)  

# printing out the rules for the classification model
rpart.rules(classification.tree, extra = 4, cover = TRUE)

# Establish confusion matrix
options(scipen = 999, digits = 5)
classification.cm.valid <- predict(classification.tree, valid.df, type = 'class')
confusionMatrix(as.factor(classification.cm.valid),as.factor(valid.df$Competitive))

# Remove ClosePrice for second confusion matrix
newEbay2.df <- newEbay.df[ , !names(newEbay.df) %in% c('ClosePrice')]

#set seed for reference
set.seed(11)

# split the df into a training and validation set. 60/40 ratio
train.index2 <- sample(c(1:dim(newEbay2.df)[1]), dim(newEbay2.df)[1]*0.6)
train2.df <- newEbay2.df[train.index, ]
valid2.df <- newEbay2.df[-train.index, ]

# create a classification tree model using the competitive column as the responce variable
classification.tree2 <- rpart(Competitive ~ ., data = newEbay2.df, control = rpart.control(maxdepth = 6), method = 'class')
summary(classification.tree2)

# plot the created model using the green, yellow and red pallette
prp(classification.tree2, type = 4, extra = 101, box.palette = "GnYlRd", 
    fallen.leaves = TRUE, branch = .3, split.font = 1, varlen = -10, 
    under=TRUE)  

# printing out the rules for the classification model
rpart.rules(classification.tree2, extra = 4, cover = TRUE)

# Establish confusion matrix
classification.cm.valid2 <- predict(classification.tree2, valid2.df, type = 'class')
confusionMatrix(as.factor(classification.cm.valid2),as.factor(valid2.df$Competitive))












