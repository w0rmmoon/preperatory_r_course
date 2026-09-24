## ---------------------------------------------------
## Preparatory R Course - Topic 8
## Conditionals & Iteration
## Exercises
## ---------------------------------------------------
##


# 1. If & Else ---------------------------------------------------------------

# 1.1 Read in the trees louisiana dataset with the adjusted units you created on day 2.
# Alternatively, read in "trees_louisiana_units.csv" from the data folder.

# 1.2 The "status" column holds information on the status of the tree with the following code:
# 0 - no info; 1 - alive; 2 - dead
# Create a subset containing only trees that have info on the tree status.

# 1.3 Use ifelse() to create a new column in the subsetted dataframe
# that is "1" for every alive tree and "0" for every dead tree.

# 1.4 How many trees are dead? (Hint: use sum).

# 1.5 Write an If/Else statements that prints a warning if more than 20% of the trees in the dataframe are dead.


# 2. Loops ----------------------------------------------------------------

# 2.1 Read in the file airquality.csv. 

# 2.2 Convert the month column to a factor.

# 2.3 Use a for loop to plot box plots of the meteorological variables (ozone, radiation, wind, temperature)
# per month.

# 2.4 Use apply() to calculate the mean and standard deviation of the meteorological variables from 2.3.
