## ---------------------------------------------------
## Preparatory R Course - Topic 9
## Writing your own functions
## Exercises
## ---------------------------------------------------
##


# 1. Basal Area -----------------------------------------------------------

# 1.1 Read in the trees louisiana dataset with the adjusted units you created on day 2.
# Alternatively, read in "trees_louisiana_units.csv" from the data folder.

trees <- read.csv("data/trees_louisiana.csv")

# 1.2 The Basal Area of the tree is its area at breast height and can be approximated as 
# π × (diameter/2)². Write a function that takes as an argument the diamater and returns the basal area.
calculate_basal_area <- function(diameter){
  basal_area <- pi * (diameter/2)**2
  return(basal_area)
}

# 1.3 Use your function to add a basal area column to the data frame.
trees$basal_area <- calculate_basal_area(diameter = trees$diameter)

