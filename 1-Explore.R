# 1-Explore.R



#------- Explore
#Understand the structure of the datasets and the variables that might be used to predict house prices

str(test)
View(test) #data contains attributes related to the lot, location, quality and condition of the buidling, building type etc.
#data includes both numeric (eg. Lot Frontage) and categorical (eg. BldgType) variables
View(head(train)) #train contains all attributes as well as the sales price

summary(train$SalePrice) #prices range from a low of $34K to $755K


#plotting the response variable:

  #----what is distribution of prices?

ggplot(train, aes(x=train$SalePrice)) + 
  geom_histogram(binwidth=25000, colour="black", fill="white") +
  geom_vline(aes(xintercept=mean(train$SalePrice, na.rm=T)),   # Ignore NA values for mean
             color="red", linetype="dashed", size=1) +
  scale_x_continuous(labels = comma) +
  xlab("Sale Price") +
  ylab("Number of Houses") + 
  theme_minimal()

# The rest of the code will follow, roughly, this Kaggle kernal: https://www.kaggle.com/notaapple/detailed-exploratory-data-analysis-using-r
#how many missing values are there?

colSums(sapply(train, is.na))



#looking at correlations

  #----isolate continuous and categorical variables
  colnames(train)
  str(train)
  cat_var <- colnames(train)[which(sapply(train, is.character))]
  numeric_var <- colnames(train)[which(sapply(train, is.numeric))]

  
  
  #convert characters to factors
  
  train[,(cat_var) := lapply(.SD, as.factor), .SDcols = cat_var]  #for more info on how to work with data tables, go here: https://www.datacamp.com/courses/data-table-data-manipulation-r-tutorial


  train_cat <- train[,.SD, .SDcols = cat_var]
  train_cont <- train[,.SD,.SDcols = numeric_var]

  #doing some plotting
  
  correlations <- cor(na.omit(train_cont[,-1, with = FALSE]))
  
  row_indic <- apply(correlations, 1, function(x) sum(x > 0.3 | x < -0.3) > 1)
  
  correlations<- correlations[row_indic ,row_indic ]
  corrplot(correlations, method="square")

