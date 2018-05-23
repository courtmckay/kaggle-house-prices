# 0-Load.R
  # Part of project to go through first Kaggle competition which aims at predicting house prices. Results and explorations will
  #be compiled in .Rmd notebook titled 'Housing Prices.Rmd'


#-------- Set up environment

#install.packages("data.table")
#install.packages("corrplot")

library(ggplot2)
library(data.table)
library(corrplot)


setwd("R/kaggle-house-prices")


#------- Load data
#I've downloaded the test and train data sets and have saved them directly in the R project file associated with this project


test <- read.csv("test.csv", stringsAsFactors = FALSE)
train <- read.csv("train.csv", stringsAsFactors = FALSE)

setDT(train)  #data must be in data table format for some of the data manipulation code to work properly using notation like .SD


