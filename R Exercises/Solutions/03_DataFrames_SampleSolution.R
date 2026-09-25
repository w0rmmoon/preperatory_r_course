## ---------------------------------------------------
## Preparatory R Course - Topic 3: Exercises
## ---------------------------------------------------
##


# 1. Dataframes & Factors -----------------------------------------------------------

# 1.1 Combine the following vectors into a data frame:
plot_ID <- 1:10
species_richness <- c(12, 14, 9, 13, 8, 12, 14, 7, 4, 10)
ecosystem <- rep(c("grassland", "forest"), each = 5)

data <- data.frame(
  plot_id = plot_ID,
  species_richness = species_richness,
  ecosystem = ecosystem
)

# 1.2 Select the 2nd entry in the 3rd row of your new data frame.
data[3, 2]

# 1.3 Create a subselection of only grassland sites.
data[data$ecosystem == "grassland", ]

# 1.4 Rename the species_richness column to richness.
names(data)[2] <- "richness"

# 1.5 Turn the ecosystem column into a factor.
data$ecosystem <- factor(data$ecosystem)


# 2. PlantGrowth Data --------------------------------------------------------

# Load the built-in Plant Growth dataset and have a look at the description.
data("PlantGrowth")
?PlantGrowth

# 2.1 Run basic summary statistics on the data
summary(PlantGrowth)

# 2.2 Calculate the mean yield of the control group.
control <- PlantGrowth[PlantGrowth$group == "ctrl", ]
mean(control$weight)
