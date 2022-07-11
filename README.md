# classificationtree

# The file eBayAuctions.csv contains information on 1972 auctions that transacted on eBay.com during May-June in 2004. 
# The goal is to use these data in order to build a model that will classify competitive auctions from non-competitive ones. 
# In this R script I created a simple classification tree after splitting the data set into train and valid dataframes (60/40) and dropping categorical #variables.
# Once this was done, I created a classification tree using the rpart library and using 'Competitive' as the response variable and everything else as #predictors
# I then plotted the classification tree and printed out its rules
# The next step was fitting a confusion matrix with respect to the validation dataframe which presented an accuracy of 0.86
# In order to make this a predictive model for future auctions, I removed the ClosePrice variable as that would not be available for future auctions and #then repeated the process
# The result was a confusion matrix with reduced accuracy, showing that ClosedPrice was neccessary in getting more accutate predictions.
