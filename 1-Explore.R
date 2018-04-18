# 1-Explore.R



#------- Explore
#Understand the structure of the datasets and the variables that might be used to predict house prices

str(test)
View(test) #data contains attributes related to the lot, location, quality and condition of the buidling, building type etc.
#data includes both numeric (eg. Lot Frontage) and categorical (eg. BldgType) variables
View(head(train)) #train contains all attributes as well as the sales price

summary(train$SalePrice) #prices range from a low of $34K to $755K

#plotting the response variable:  ###ended here

ggplot(data = train$SalePrice,
  aes(x=train@SalePrice))




