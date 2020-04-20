# CHAPTER 1 : Data Visualization wiht ggplot2 #####

## Read http://vita.had.co.nz/papers/layered-grammar.pdf to understand ggplot2 grammar ### 

# Load libraries ### 
library(tidyverse)

# Load data mpg (found in ggplot2 package) ####

ggplot2::mpg

# To learn about data set mpg ####

?mpg

# Relationship between hwy (fuel efficiency highway mpg) and displ (engine displacement (ie a car's engine size in liters))

# Draw a scatter plot 

ggplot(data  = mpg ) + 
  geom_point(mapping = aes (x = displ, y = hwy))

   # Conclusion: There exists a negative realationship between displacement size and fuel efficiency

# Analyzing the components of the function

ggplot()   # creates a coordinate system that you can add layers to
ggplot(data = mpg)  # First argument to ggplot() -- ggplot knows that data to use in the graph in mpg
                    # Then add geom_point() adds a layers of points to the ggplot which creates a scatterplot
                    # Each geom function takes a mapping argument which tell you how each of your variables are mapped to visual properties
                    # mapping is paired with aes() and arguments in aes() tell you which variables map to the x-axes and y axes.
                    # aes specifies which variables to map to the x and y variables


# Exercises ####

# 1 Run ggplot(data = mpg). What do you see? 
ggplot(data = mpg)

# 2 How many rows are in mtcars? How many columns? 

ncol(mpg)
   
  # 11 columns are in mpg

# 3 What does the drv variables describe? 

?mpg

   # drv variable describes the type of drive train. f = front-wheel drive. r = rear wheel drive. 4 = 4wd 

# 4 Make a scatterplot qof hwy versus cyl

ggplot(data = mpg) +
  geom_point(mapping = aes(x = cyl, y = hwy))

# 5 What happens if you make a scatterplot of class versus drv? 
#.. Why is the plot not useful? 

   # you will get a graph that is not meaningful because class and drv arecategorical.
   # Scatterplot is meant to graph variables that are numerical

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = class, y = drv))

########################## End Exercises ##################################


# Aethestic Mapping #### 

# Look at 

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

# Is there any way we can get more information about those points? Let's look at our variables 
#.. which do you think is a variable that can tell us something about those points?
?mpg

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

# What can you conclude about the points ? 
#.. That most of the unusual points are two-seater cars. They are probably sports cars!!
#.. Sports cars have large engines (big dipl) but small bodies which improves their gas mileage.

# Try using size instead of color in your code. What happens? 

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, size = class))

   # We get a warning because class is a categorical variable. 
   # Mapping an unordered variable to an ordered aesthetic is not a good idea
   # color is a better choice in this case

# Try using the alpha aesthetic. It controls the transparency of the points or the shape of the points

 # alpha aesthetic

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

# Try using the shape aesthetic

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

   # What happened to the suv shape ? ggplot2 only uses six shapes at a time. Additional groups will go unplotted when you use this
   # aesthetic - so, be careful! 

# Setting the aesthetic properties of your geom manually. 

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = 'blue') # Notice here color goes outside of the aes


# There are 25 built-in shapes that are identified by numbers

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), shape = 4) # Notice here color goes outside of the aes

# Exercises 

# 1  Find the problem in the code below: 

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = 'blue'))

  # Problem is color is inside the aes, so the framework tries to plot the color against an attribute “blue”, 
  # but this does not exist within the data

# 2 Which variables in mpg are categorical? 

str(mpg)
   
  # manufacturer, model, year, trans, drv, fl, class 

# 3 Map a continuous variable to color, size, and shape. How do these aesthetics behave differently for cateogrical
# .. versus continuous variables? 

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = cty, size = , shape  = cty))

    # Will display data points with higher cty (city miles per gallon) in a darker color
    # A scale will show 
   
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, size = cty))

    # Will display data points with higher cty (city miles per gallon) using a bigger circle)
    # Look at left top corner of graph. You'll see that 

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ , y = hwy, shape = cty))

    # Will give an error a continuous variable cannot be mapped to a shape


ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ , y = hwy, shape = cty))