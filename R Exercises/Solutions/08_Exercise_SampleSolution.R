## ---------------------------------------------------
## Preparatory R Course - Topic 8
## Conditionals & Iteration
## Exercises
## ---------------------------------------------------
##


# 1. If & Else ---------------------------------------------------------------

# 1.1 Read in the trees louisiana dataset with the adjusted units you created on day 2.
# Alternatively, read in "trees_louisiana_units.csv" from the data folder.

trees <- read.csv("data/trees_louisiana.csv")

# 1.2 The "status" column holds information on the status of the tree with the following code:
# 0 - no info; 1 - alive; 2 - dead
# Create a subset containing only trees that have info on the tree status.
trees <- trees[trees$status > 0, ]

# alternative
trees <- trees |> dplyr::filter(status > 0)

# 1.3 Use ifelse() to create a new column in the subsetted dataframe
# that is "1" for every alive tree and "0" for every dead tree.
trees$alive <- ifelse(trees$status == 1, 1, 0)

# 1.4 How many trees are dead? (Hint: use sum).
(number_dead_trees <- sum(trees$alive))

# 1.5 Write an If/Else statements that prints a warning if more than 20% of the trees in the dataframe are dead.
if(number_dead_trees > 0.8 * nrow(trees)){
  print("warning: more than 20% trees dead")
} else {
  print("no warning")
}

# 2. Loops ----------------------------------------------------------------

# 2.1 Read in the file airquality.csv. 
airquality <- read.csv("data/airquality.csv")


# 2.2 Convert the month column to a factor.
airquality$Month <- factor(airquality$Month)

# 2.3 Use a for loop to plot box plots of the meteorological variables (ozone, radiation, wind, temperature)
# per month.
par(mfrow = c(2, 2))
for(i in 2:5){
  boxplot(airquality[, i] ~ airquality$Month,
          ylab = names(airquality)[i], xlab = "Month")
}
par(mfrow = c(1,1))

# 2.4 Use apply() to calculate the mean and standard deviation of the meteorological variables from 2.3.
apply(airquality[, 2:5], MARGIN = 2, FUN = mean, na.rm = T)
apply(airquality[, 2:5], MARGIN = 2, FUN = sd, na.rm = T)
