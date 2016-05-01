##################################################################################################
#################################### GGPLOT2 Tutorial = ##########################################
##################################################################################################

#ggplot2 basics
ggplot(dataset, aes(x = var, y = var)) +
  geom_point()  #functions - how should x and y be plotted

#dataset: 
mtcars

#----------------------------- ggplot2 tutorial Datacamp
# Load the ggplot2 package
install.packages("ggplot2")
library(ggplot2)

# Change the command below so that cyl is treated as factor - factor means that the value cyl is treated as categorical value
ggplot(mtcars, aes(x = factor(cyl), y = mpg)) +
  geom_point()
!!!! # Use "faction(variable)" - to access an categorical/almost ordinal scale
  #such variables are often refered to as categorical variables. 
  #One of the most important uses of factors is in statistical modeling; 
  #since categorical variables enter into statistical models differently 
  #than continuous variables, storing data as factors insures that the modeling 
  #functions will treat such data correctly.
  
  
  
# A scatter plot has been made for you
ggplot(mtcars, aes(x = cyl, y = mpg)) +
  geom_point()  # a simple scatterplot 


# Replace ___ with the correct vector: we use the disp variable to create the legend
ggplot(mtcars, aes(x = wt, y = mpg, col = disp)) +  
  # the col argument makes sure there is a  colorscale that corresponds to the fillings of the datapoints
  # The color should be dependent on the displacement of the car engine, found in disp. 
  # In the third call of ggplot()
  geom_point()

# Replace ___ with the correct vector
ggplot(mtcars, aes(x = wt, y = mpg, size = disp)) +
  # In the third call of ggplot() change the size argument in aes() 
  # (which stands for aesthetics). The size should be dependent on the displacement of the car 
  # engine, found in disp.
  geom_point()


######################## ggplot2 shapes #######################
In the previous exercise we saw that disp can be mapped onto a color gradient or onto a continuous size scale.
Another argument of aes() is the shape of the points. There is a finite amount of shapes which ggplot() 
can automatically assign to the points. However, if you try this command in the console to the right:
  
  
  #both size and color
  # Replace ___ with the correct vector
  ggplot(mtcars, aes(x = wt, y = mpg, size = disp, col = disp)) +
  geom_point()

################## The grammer of graphics ######################
first Data #use dataset
Aestertics # aes() define x and y
Geometry #  what, points, line whatevers
Facets # meaning: how to split up the plot, each for one specie: facet_grid
Statistics # 
Coordinates # labeling
Theme # theme of plot


###### excercises ########
Explore the diamonds data frame with the str() function.
Use the + operator to add geom_point() to the first ggplot() command. This will tell ggplot2 to draw points on the plot.
Use the + operator to add geom_point() and geom_smooth(). These just stack on each other! geom_smooth() will draw a smoothed line over the points.

#Dimaond data - scatterplot:
diamonds <- diamonds
View(diamonds)

# Explore the diamonds data frame with str()
str(diamonds)

# Add geom_point() with  CAREFUL, the plus operator needs to be at the end of each line
ggplot(diamonds, aes(x = carat, y = price)) + 
  geom_point() 

# more indo on geom_point: http://www.rdocumentation.org/packages/ggplot2/functions/geom_point

#The code for last plot of the previous exercise is available in the script on the right. It builds a scatter plot of the diamonds dataset, with carat on the x-axis and price on the y-axis. geom_smooth() is used to add a smooth line.
# The plot you created in the previous exercise
ggplot(diamonds, aes(x = carat, y = price)) + 
  geom_point() +
  geom_smooth()
# more indo on geom_point: http://www.rdocumentation.org/packages/ggplot2/functions/geom_smooth

################################# end









############# MORE GEOMS POSSIBLES #############################
# Copy the above command but show only the smooth line
ggplot(diamonds, aes(x = carat, y = price)) +
  geom_smooth()    # now we get only the smooth line 


# Copy the above command but show only the smooth line
ggplot(diamonds, aes(x = carat, y = price, col = clarity)) +
  geom_smooth()
# this splits up the different character variables in clarity, and returns the line for each

#For the last command, hold the color settings from the previous instructions. 
# This time plot the points, but set the alpha argument of geom_point() to 0.4. 
# This will make the points 40% transparent. Do not include geom_smooth().
ggplot(diamonds, aes(x = carat, y = price, col = clarity)) + 
  geom_point(alpha = 0.4)   
# alpha in geom_points reduces the opacity of the drawn points/lines

##########################  Can call aes() also inside the geom_ function ####

# Create the object containing the data and aes layers: 
dia_plot <- ggplot(diamonds, aes( x = carat, y = price))

# Add a geom layer with + and geom_point()
dia_plot + 
  geom_point()

# Add the same geom layer, but with aes() inside
dia_plot + 
  geom_point( aes(col = clarity))

################################# end






########################## on't want any error shading ########### se = FALSE ##########
#You dont want any error shading, which can be achieved by setting the se argument in geom_smooth() to FALSE. set.seed(1)

# The dia_plot object has been created for you
dia_plot <- ggplot(diamonds, aes(x = carat, y = price))

# Expand dia_plot by adding geom_point() with alpha set to 0.2
dia_plot + 
  geom_point(alpha = 0.2)

# Plot dia_plot with additional geom_smooth() with se set to FALSE
dia_plot +
  geom_smooth(se = F)

# Copy the command from above and add aes() with the correct mapping to geom_smooth()
dia_plot +
  geom_smooth(se = F, aes(col=clarity))

################################# end





##### Using base packaged #######

# Plot the correct variables of mtcars
plot(mtcars$wt, mtcars$mpg, col = mtcars$cyl)
# Change cyl inside mtcars to a factor
mtcars$cyl <- as.factor(mtcars$cyl)  # generally imporant - change variable type
# Make the same plot as in the first instruction
plot(mtcars$wt, mtcars$mpg, col = mtcars$cyl)

###################### Linear models = lm #########################
#Fitting Linear Models, Description
#lm is used to fit linear models. 
#It can be used to carry out regression, 
#single stratum analysis of variance and analysis of covariance 
#(although aov may provide a more convenient interface for these).

#Usage example on: http://www.rdocumentation.org/packages/stats/functions/lm

########################## how to create a linear model ########################## 
# Basic plot
mtcars$cyl <- as.factor(mtcars$cyl)
plot(mtcars$wt, mtcars$mpg, col = mtcars$cyl)

# Use lm() to calculate a linear model and save it as carModel
carModel <- lm(mpg ~ wt, data = mtcars)  #### You can use lm() as follows: lm(var1 ~ var2, data = dataset). Of course fill in the correct variables and dataset.

# Call abline() with carModel as first argument and lty as second ### abline() takes a linear model object (created by lm()) as first argument. Don't forget to set the lty argument as well.
abline(carModel, lty = 2)

# Plot each subset efficiently with lapply
# You don't have to edit this code
lapply(mtcars$cyl, function(x) {
  abline(lm(mpg ~ wt, mtcars, subset = (cyl == x)), col = x)
})

# This code will draw the legend of the plot
# You don't have to edit this code
legend(x = 5, y = 33, legend = levels(mtcars$cyl), 
       col = 1:3, pch = 1, bty = "n")

################################# end





########################### Recreating the base package in GGPLOT2 ##############
### here everyhting about Geom_smooth: http://www.rdocumentation.org/packages/ggplot2/functions/geom_smooth


# instructions:
#Copy, paste and expand the previous command; add a linear model for each subset according to cyl by adding a geom_smooth() layer. Inside geom_smooth(), set method to "lm" and se to FALSE. Note here that ggplot2 will automatically draw a line per cyl subset, it recognizes the groups you want to make per color in the aes() call within the ggplot() command.
#Copy, paste and expand the previous command. Plot a linear model for the entire dataset. Do this by adding another geom_smooth() layer. Set the group aesthetic in this geom to 1 and the linetype to 2. This means group has to be set within aes() of geom_smooth(), but linetype has to be set outside aes() of geom_smooth(). The group aesthetic will tell ggplot() to draw a single linear model through all the points. Don't forget to set method to "lm" and se to FALSE like you did in the previous command.

#### Example how to run a linear model:
# Convert cyl to factor
mtcars$cyl <- as.factor(mtcars$cyl)

# Example from base R
plot(mtcars$wt, mtcars$mpg, col = mtcars$cyl)
abline(lm(mpg ~ wt, data = mtcars), lty = 2)
lapply(mtcars$cyl, function(x) {
  abline(lm(mpg ~ wt, mtcars, subset = (cyl == x)), col = x)
})
legend(x = 5, y = 33, legend = levels(mtcars$cyl), 
       col = 1:3, pch = 1, bty = "n")

# Add geom_point() to this command to create a scatter plot
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point()

# Copy, paste and expand previous command to include the lines of the linear models, per cyl
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

#### draws it without splitting it up into cyl groups
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm", se = TRUE)

# Copy, paste and expand previous command to include a lm for the entire dataset in its whole
####  This time the first argument should be a aes() mapping with group = 1. Don't forget to set the linetype as defined in the instructions. This is an argument of geom_smooth(), not of aes(). method and se should be set as in the previous command.
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  geom_smooth(aes(group = 1), method = "lm", se = FALSE, linetype = 2)


################################# end







############################ Small multibles, facet view ###########

# Consider the structure of iris, iris.wide and iris.tidy (in that order)
str(iris)
str(iris.wide)
str(iris.tidy)

# Think about which dataset you would use to get the plot shown right
# Fill in the ___ to produce the plot given to the right
ggplot(iris.tidy, aes(x = Species, y = Value, col = Part)) +
  geom_jitter() +
  facet_grid(. ~ Measure)


########################### how to make the data clean = that is that all variables are accessible!!!!
#In the last exercise we saw how iris.tidy was used to make a specific plot. It's important to know how to rearrange our data in this way so that our plotting functions become easier. In this exercise we'll use functions from the tidyr package to convert iris to iris.tidy.

#The iris.tidy data should look as follows:

#  Species  Part Measure Value
#1  setosa Sepal  Length   5.1
#2  setosa Sepal  Length   4.9
#3  setosa Sepal  Length   4.7
#4  setosa Sepal  Length   4.6
#5  setosa Sepal  Length   5.0
#6  setosa Sepal  Length   5.4
#...
#You can have a look at the iris dataset by typing head(iris) in the console.
library(tidyr)
?gather


We'll use two functions from the tidyr package:

gather() rearranges the data frame by specifying the columns that are categorical variables with a - notation. Complete the command. Notice that only one variable is categorical in iris.
separate() splits up the new key column, which contains the former headers, according to .. The new column names "Part" and "Measure" are given in a character vector. Don't forget the quotes.

# Load the tidyr package
library(tidyr)

# Fill in the ___ to produce to the correct iris.tidy dataset
iris.tidy <- iris %>%
  gather(key, Value, - Species) %>%
  separate(key, c("Part", "Measure"), "\\.") 

################################# end






############################### GGPLOT AESTETICS ######### 
# http://www.rdocumentation.org/packages/ggplot2/functions/aes

#In the video we saw 9 visible aesthetics. Lets apply them to a categorical variable - the cylinders in mtcars, cyl.
#(Well consider line type when we encounter line plots in the next chapter).
#These are the aesthetics we can consider within aes() in this chapter: x, y, color, fill, size, alpha, labels and shape.
#In the following exercise you can assume that the cyl column is categorical. It has already been transformed into a factor for you.

#excerxise:
# Map cyl to y
ggplot(mtcars, aes(x = mpg, y = cyl)) + 
  geom_point()

# Map cyl to x
ggplot(mtcars, aes(y = mpg, x = cyl)) + 
  geom_point()

# Map cyl to col
ggplot(mtcars, aes(y = mpg, col = cyl, x = wt)) + 
  geom_point()

# Change shape and size of the points in the above plot: ggplot circles
ggplot(mtcars, aes(y = mpg, col = cyl, x = wt)) + 
  geom_point(shape = 1, size = 4)

######## Fill asteatics #### Excercise: 

#Good job! Notice that mapping a categorical variable onto fill doesnt change the colors, although a 
#legend is generated! 
#This is because the default shape for points only has a color attribute and not a fill attribute. 
#Use fill when you have another shape (such as a bar), or when using a point that does have a fill 
#and a color attribute, such as shape = 21, which is a circle with an outline. Any time you use a 
#solid color, make sure to use alpha blending to account for over plotting.

# Given from the previous exercise
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point(shape = 1, size = 4)

# Map cyl to fill
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) +
  geom_point()

# Change shape, size and alpha of the points in the above plot
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) +
  geom_point(shape = 16, size = 6, alpha = 0.6)

########### Excercise - all kinds of AES aestatics features

# Map cyl to size
ggplot(mtcars, aes(y = mpg, x = wt, size = cyl)) +
  geom_point();


# Map cyl to alpha
ggplot(mtcars, aes(y = mpg, x = wt, alpha = cyl)) +
  geom_point();


# Map cyl to shape 
ggplot(mtcars, aes(y = mpg, x = wt, shape = cyl)) +
  geom_point();


# Map cyl to labels
ggplot(mtcars, aes(y = mpg, x = wt, label = cyl)) +
  geom_text();    # important, use geom_text here

#### Excercise - attributes and aestetics are NOT the same: ood job! 
#Notice that if an aesthetic and an attribute are set with the same argument, 
#the attribute takes precedence. Once again, we see that the attribute needs 
#to match the shape and geom, the fill aesthetic (or attribute) will only work with certain shapes.

# Excersice: 
# Expand to draw points with alpha 0.5
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) +
  geom_point(alpha = 0.5)

# Expand to draw points with shape 24 and color yellow
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) +
  geom_point(shape = 24, color = 'yellow')

# Expand to draw text with label x, color red and size 10
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) +
  geom_text(label = "x", color = 'red', size = 10)

###### more astetics features: 

aes() should map mpg onto x, qsec onto y and factor(cyl) onto col. Dont forget to add geom_point(), without arguments.
aes() should map factor(am) onto shape. Dont forget to add geom_point(), without arguments.
aes() should map (hp/wt) onto size. Dont forget to add geom_point(), without arguments.
Change geom_point() to geom_text(). aes() should map rownames(mtcars) onto label.

# Map mpg onto x, qsec onto y and factor(cyl) onto col
ggplot(mtcars, aes(x = mpg, y = qsec, col = factor(cyl))) +
  geom_point()

# Add mapping: factor(am) onto shape
ggplot(mtcars, aes(x = mpg, y = qsec, col = factor(cyl), shape = factor(am))) +
  geom_point()

# Add mapping: (hp/wt) onto size
ggplot(mtcars, aes(x = mpg, y = qsec, col = factor(cyl), shape = factor(am), size = hp/wt)) +
  geom_point()

# Add mapping: rownames(mtcars) onto label
ggplot(mtcars, aes(x = mpg, y = qsec, col = factor(cyl), shape = factor(am), size = hp/wt)) +
  geom_text(aes(label = rownames(mtcars)))


# Many of the aesthetics can be mapped onto continuous or categorical variables, but some are restricted to categorical data. Which aesthetics are they?

# label & shape are restricted to categorical data (you need a factor() for this i think)

################################# end








####################################### DATA CLEANING for PLOTTING ####################################
#data cleaning process: 1. data exploration

#### Process data exploration
#1. read in data 
data <- read.csv("url", header=TRUE)
#2. View the class
class(data)
[1] "data.frame"
#3. Dimentions: displays number of rows first, then columns
dim(data)
#4. Names function: exploring the column names
dim(data)
#5. str function on dataframe: rows = observations, columns are variables, datatypes
str(dataframe)
#6 glimpse(data) function - overview function for dataframes by dyplr
glimpse(data)
#7 summary function 
summary(data)

#### Process data exploration 2
head(data)  or tail(data)  , or head(data, n = 15) for 15 rows

#plot a histogram to see distributions: 
hist(data$variable)
hist(data$perc_free_red)

#plot for scatterplots
plot(data$xaxisvar, data$yaxisvar)

# Histogram of BMIs from 2008
hist(bmi$Y2008)

# Scatter plot comparing BMIs from 1980 to those from 2008
plot(bmi$Y1980, bmi$Y2008)

################################# end














###### Histogram barchart ########################################

# All the visible aesthetics can serve as attributes and aesthetics,
# a y-axis will always be provided, even if we didn't ask for it.

head(mtcars)

# save this in a variable, where fill is set in the aes layer
cyl.am <- ggplot(mtcars, aes(x = factor(cyl), fill = factor(am)))

#### several options to present the data: 

# 1. 
# Add geom (position = "stack" by default)
# so bars are stacked as default
cyl.am + 
  geom_bar()

# 2.
# Fill - show proportion
# with fill, you, change to the stacked bar chart view, count is then on y
cyl.am + 
  geom_bar(position = "fill")  

# 3.
# Dodging - principles of similarity and proximity
cyl.am +
  geom_bar(position = "dodge") 

# 4.
# Clean up the axes with scale_ functions
val = c("#E41A1C", "#377EB8")
lab = c("Manual", "Automatic")
cyl.am +
  geom_bar(position = "dodge") +
  scale_x_discrete("Cylinders") + # xaxis descr
  scale_y_continuous("Number") +
  # yaxis descr
  scale_fill_manual("Transmission", 
                    values = val,
                    labels = lab)
#The first argument is the title of the legend: "Transmission". Next, values and labels are set to predefined values for you. These are the colors and the labels in the legend.#



########## geo_jitter for OVERPLOTTING ##########
## more info: http://docs.ggplot2.org/current/geom_jitter.html
########## GEO_jitter helps you to spot overplotting, the dots are equally surrouded by the other dots ####
ggplot(mpg, aes(cty, hwy)) + geom_jitter(width = 0.01, height = 0.01)
ggplot(mpg, aes(cty, hwy)) + geom_jitter(width = 0.5, height = 0.5)
ggplot(mpg, aes(cty, hwy)) + geom_jitter(width = 10, height = 10)


########## Use jittery in plotting ###########

#1.  Add a new column called group
# Try to run ggplot(mtcars, aes(x = mpg)) + geom_point() in the console. x is only one of the two essential aesthetics for geom_point(), which is why we get an error message.
mtcars$group <- 0  
 # To fix this, add a new column to the mtcars data frame called group. Populate it with the number 0.

#2.  Create jittered plot of mtcars: mpg onto x, group onto y
# Now define a new ggplot() function call: with the extended mtcars dataset, map mpg onto x and map group onto y. Use geom_jitter() to not have all the lines on a horizontal line.
ggplot(mtcars, aes(x = mpg, y = group)) + 
  geom_jitter()


#3.  Change the y aesthetic limits  #### Y Axis Limits #####
# To make everything look nicer, copy, paste and adapt the code for the previous plot. You'll want to change the limits of the y axis using the appropriate scale_y_...() function. Set the limits argument to c(-2, 2).
ggplot(mtcars, aes(x = mpg, y = group)) + 
  geom_jitter() +
  scale_y_continuous(limits = c(-1, 1))  # set the limits here for the y axis




################# Overplotting 1 - Point shape and transparency #######################
# tricks to spot overlays, dont use solid shapes!!!!!!!!

# use shape = 1, no fill, only stroke in the geom layer
# use col to sort
# add transparancy by using alpha = 0.6 in the geom layer

# Basic scatter plot of wt on x-axis and mpg on y-axis; map cyl to col
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point(size = 4)

# Hollow circles - an improvement
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point(size = 4, shape = 1)

# Add transparency - very nice
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point(size = 4, alpha = 0.6)


####### Overplotting 2 - alpha with large datasets #########
#data = diamonds
#str(diamonds)
#53940 obs. of  10 variables:
x <- 53940*10
print(x)
# [1] 539400


# Scatter plot: carat (x), price (y), clarity (col)
ggplot(diamonds, aes(x = carat, y = price, col = clarity)) +
  geom_point()


# Adjust for overplotting
ggplot(diamonds, aes(x = carat, y = price, col = clarity)) +
  geom_point(alpha = 0.5)



# Scatter plot: clarity (x), carat (y), price (col)
ggplot(diamonds, aes(x = clarity, y = carat, col = price)) +
  geom_point(alpha = 0.5)


# Dot plot with jittering
ggplot(diamonds, aes(x = clarity, y = carat, col = price)) +
  geom_point(alpha = 0.5, position = "jitter")


############ Overplotting 2 - alpha with large datasets #######################################
# In a previous exercise we defined four reasons in which we'd have to adjust for overplotting. We'll consider the last two here with the diamonds dataset:

#Large datasets.
# Aligned data values on a single axis
# Scatter plot: carat (x), price (y), clarity (col)
# ggplot(diamonds, aes(x = carat, y = price, col = clarity)) +
# geom_point()

# In the previous plot, all the individual values line up on a single axis within each clarity category, so we have not overcome overplotting. Modify the above plot to use the position = "jitter" inside geom_point().

# Adjust for overplotting
# The diamonds data frame is available in the ggplot2() package. Begin by making a basic scatter plot of price (y) vs. carat (x) and map clarity onto col.
ggplot(diamonds, aes(x = carat, y = price, col = clarity)) +
  geom_point(alpha = 0.5)


# Scatter plot: clarity (x), carat (y), price (col)
# Copy the above functions and set the alpha to 0.5. This is a good start to dealing with the large dataset.
ggplot(diamonds, aes(x = clarity, y = carat, col = price)) +
  geom_point(alpha = 0.5)


# Dot plot with jittering
# Align all the diamonds within a clarity class, by plotting carat (y) vs. clarity (x). Map price onto col. alpha should still be 0.5.
ggplot(diamonds, aes(x = clarity, y = carat, col = price)) +
  geom_point(alpha = 0.5, position = "jitter")


#### end









######## READ IN, READ OUT ###############


## Input a table as CSV: 
dd <- read.csv("/Users/BH/DataJavascript/nesting/data/cdc.csv", header = T)

## Output a table as CSV: 
ddlong <- read.csv("/Users/BH/DataJavascript/nesting/data/cdc2.csv", header = T)
write.table(ddlong, "/Users/BH/DataJavascript/nesting/data/dataJavascript.csv", sep=",")

##################################################################################################
#################################### END of CHEETSHEET ###########################################
##################################################################################################
