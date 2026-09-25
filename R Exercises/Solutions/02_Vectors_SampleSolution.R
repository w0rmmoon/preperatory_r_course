## ---------------------------------------------------
## Preparatory R Course - Topic 2: Exercises
## ---------------------------------------------------
##


# 1. Creating Vectors -----------------------------------------------------

# 1.1 Create a vector that holds the numbers 1 through 100.
(my_vector1 <- 1:100)

# 1.2 Create a vector that holds the words "I", "am", "learning", and "R".
(my_vector2 <- c("I", "am", "learning", "R"))

# 1.3 Create a vector that holds the numbers 1 through 5 ten times.
(my_vector3 <- rep(1:5, 10))


# 2. Vector Calculation ---------------------------------------------------

# 2.1 Calculate the area of rectangles with the following dimensions:
width <- c(1.9, 2.8, 9.1, 4.3)
height <- c(9.4, 8.2, 1.9, 0.3)

width * height

# 2.2 What is the result of the following expression? 
# Write down your answer before running the code to confirm it.
c(3, 6, 9, 12) / c(3, 6)

# answer: 1, 1, 3, 2 - since second vector is recycled

# 3. Selecting Vector Values ----------------------------------------------

# The following vector describes the measured snowfall depth across multiple days.

snowfall <- c(2, 1, 0, 0, 3, 4, 2, 0, 6)

# 3.1. Select day 4 to 6 from the snowfall vector.
snowfall[4:6]

# 3.2. Replace the value of day 3 with "1". 
snowfall[3] <- 1
snowfall

# 3.3. Select only days where snowfall is greater than 0.
snowfall[snowfall > 0]

# 3.4. Select only days where snowfall is either below 2 or above 4 cm.
snowfall[snowfall < 2 | snowfall > 4]

# 3.5. Which day has the maximum snowfall depth?
snowfall[which.max(snowfall)]


# 4. Missing Values -------------------------------------------------------

# Consider this vector of measured tree height.
tree_height <- c(12.4, 13.1, NA, 19.3, 16.9)

# 4.1. Why does this function result in NA? Change it to not represent NA.
mean(tree_height)

# because of the missing value (NA)
# we need to set na.rm = T for the function to work
mean(tree_height, na.rm = T)

# 4.2. How can you check whether data contains any NAs?
any(is.na(tree_height))

# 4.3. Select only values that are not NA.
tree_height[!is.na(tree_height)]
