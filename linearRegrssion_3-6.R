# linerar regrssion in R - 3.6 Statistical Learning Methods

#Basic functions
#that perform least squares linear regression and other simple analyses come
#standard with the base distribution, but more exotic functions require additional libraries

# least squares linear regression

# loading data into the console
library(MASS)
install.packages("ISLR")
library(ISLR)

# 3.6.2 Simple Linear Regression 
#Data: Boston data set, which records medv (median house value) for 506 neighborhoods around Boston
#We will seek to predict
#medv using 13 predictors such as rm (average number of rooms per house),
#age (average age of houses), and lstat (percent of households with low socioeconomic status).

# response is median house value, predictors are the 13 metrics

lm.fit = lm(medv~lstat, data=Boston)
attach(Boston)


#We will start by using the lm() function to fit a simple linear regression lm() model, 
#with medv(median house value) as the response and lstat as the predictor. The basic
#syntax is lm(y∼x,data), where y is the response, x is the predictor, and
#data is the data set in which these two variables are kept.
## (?lm  == is the linear model)


