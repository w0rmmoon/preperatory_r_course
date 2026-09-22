## ---------------------------------------------------
## Preparatory R Course - Topic 3: Exercises
## ---------------------------------------------------
##


# 1. Dataframes & Factors -----------------------------------------------------------

# 1.1 Combine the following vectors into a data frame:
plot_ID <- 1:10
species_richness <- c(12, 14, 9, 13, 8, 12, 14, 7, 4, 10)
ecosystem <- rep(c("grassland", "forest"), each = 5)

# 1.2 Select the 2nd entry in the 3rd row of your new data frame.

# 1.3 Create a subselection of only grassland sites.

# 1.4 Rename the species_richness column to richness.

# 1.5 Turn the ecosystem column into a factor.


# 2. PlantGrowth Data --------------------------------------------------------

# Load the built-in Plant Growth dataset and have a look at the description.
data("PlantGrowth")
?PlantGrowth

# 2.1 Run basic summary statistics on the data

# 2.2 Calculate the mean plant growth of the control group.


