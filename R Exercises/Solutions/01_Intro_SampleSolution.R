## ---------------------------------------------------
## Preparatory R Course - Topic 1: Exercises
## ---------------------------------------------------
##

# 1. Pocket Calculator ----------------------------------------------------

# 1.1 Write and execute examples for all major arithmetic operations (addition,
# subtraction, multiplication, division).
2 + 2 # addition
9 - 4 # subtraction
2 * 9 # multiplication
10 / 7 # division

# 1.2 What is 4 to the power of 10?
4**10
# alternative:
4^10

# 1.3 What is the difference between division and integer division?
# division returns the number including decimal points
6 / 4

# integer division rounds down to the nearest whole number
6 %/% 4

# 1.4 Calculate the area of a circle with a radius of 10 cm.
pi * 10^2


# 2. Objects ----------------------------------------------------------------

# 2.1. Calculate the volume of a cube with a length of 4 cm. Save the object as a
# variable named volume.
volume <- 4^3
# alternative
volume <- 4 * 4 * 4

# 2.2. Print the value of volume to the console.
print(volume)

# 2.3. Overwrite the volume object with the volume of a cube with a length of 10 cm.
volume <- 10^3

# 3. Data Types ---------------------------------------------------------------

# 3.1. What are the main data types used in R? Think of an exemplary variable that
# could be saved in each one.
length <- 7.3 # numeric
semester <- 1L # integer
species <- "Fagus Sylvatica" # character
alive <- TRUE # boolean


# 3.2. Assign the value 19.4 to a variable called height. What is the object's data type?
height <- 19
str(height)

# 3.3. Consider the following objects:
a <- 12
b <- "I am learning R!"
c <- 10
d <- TRUE

# What is the result of the following operations? Why?
# a + b
# error - can't add character to numeric
a + b

# a + c
# 22 (10 + 12)
a + c

# a + d
# 13 - since TRUE is internally saved as 1
a + d

# 4. Functions ------------------------------------------------------------

# 4.1. Calculate the square root of 361.
sqrt(361)

# 4.2. I want to round the number 3.2931 to two digits. Change this code
# so it works as intended.

round(2, 3.2931)

# changed to:
round(3.2931, 2)

# or:
round(digits = 2, x = 3.2931)

# 4.3. Check the help for the function abs(). 
# What does it do? What argument(s) does it take?
# Give a usage example.
?abs

# abs() gives the absolute value of a number.
abs(-7)


# 5. Advanced -------------------------------------------------------------

# 5.1. Convert tree_dbh to numeric.
tree_dbh <- as.numeric(tree_dbh)

# 5.2. Check documentation for the function sample() and use it to simulate a lottery draw 
# (drawing 6 random numbers out of 1-49).
?sample

sample(x = 49, size = 6, replace = F)
