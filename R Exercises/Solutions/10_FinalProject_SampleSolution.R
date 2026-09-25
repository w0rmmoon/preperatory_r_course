# Loading packages used later in the script
library(dplyr)
library(ggplot2)

# 1. Setup ----------------------------------------------------------------
 
# 1.1 Read in the file final-project.csv from the data folder.
trees <- read.csv("data/final-project.csv")

# 1.2 How many observations are there?
nrow(trees)
   
# 1.3 What columns are there? What is their data type?
str(trees)

# 1.4 What time frame does the data cover?
range(trees$year)

# alternative: use summary() to see the maximum to minimum of the column
summary(trees)

#   Should any columns be converted into factors? If yes, do so.
# converting country_code and region into factors 
# ("year" could also possibly be converted into a factor)
trees$county_code <- factor(trees$county_code)
trees$region <- factor(trees$region)

# 2. Data Cleaning

# 2.1 Create a new dataset with only data from 2010 and later. Work with this dataset for all subsequent analysis.
trees_subset <- trees[trees$year >= 2010, ]

# dplyr alternative:
trees_subset <- trees |> filter(year >= 2010)

# 2.2 Convert the “diameter” column to centimeters and the “height” column to meters.
trees_subset$diameter_cm <- trees_subset$diameter * 2.54
trees_subset$height_m <- trees_subset$height * 0.3048

# dplyr alternative:
trees_subset <- trees_subset |>
  mutate(
    diameter_cm = diameter * 2.54,
    height_m = height * 0.3048
  )

# Add a column with the percentage of alive trees.
trees_subset$alive <- (trees_subset$trees_alive / trees_subset$number_trees) * 100

# dplyr alternative
trees_subset <- trees_subset |>
  mutate(alive = (trees_alive / number_trees) * 100)

# 3. Data Exploration
 
# 3.1 What is the highest and lowest species richness?
max(trees_subset$species_richness) # max
min(trees_subset$species_richness) # min


#   What is the average height and diameter of the trees?
mean(trees_subset$height_m, na.rm = T)
mean(trees_subset$diameter_cm, na.rm = T)

# alternative
apply(trees_subset[, c("height_m", "diameter_cm")], MARGIN = 2, FUN = mean, na.rm = T)


# 4. Data Visualization

# 4.1 Create a scatter plot with the number of trees on the x axis and the species richness on the y axis. 
# Visually distinguish the different regions. Add a legend and axes labels.

# create color vector 
colors_plot <- c("red", "green", "blue", "black", "orange")

# create scatter plot (y ~ x)
plot(trees_subset$species_richness ~ trees_subset$number_trees,
     col = colors_plot[trees_subset$region], # vary color by region
     xlab = "number of trees",
     ylab = "species richness")

# add legend
legend("bottomright",
       legend = levels(trees_subset$region),
       col = colors_plot,
       pch = 1,
       title = "region")

# alternative: ggplot2
ggplot(trees_subset, aes(x = number_trees, y = species_richness, colour = region)) +
  geom_point() +
  labs(x = "number of trees", y = "species richness")

# 4.2 Create a single line plot of the number of total trees and the number of alive trees over time
# in county 1. Add a legend and axes labels.

# create subset with county 1, 3, 5, 7
trees_county <- trees_subset[trees_subset$county_code == 1, ]

# create line plot with number of trees (y ~ x)
plot(trees_county$number_trees ~ trees_county$year,
     type = "l", # line plot
     col = "black",
     ylim = c(0, 260),
     xlab = "year",
     ylab = "count") # change y limit to line added later is visible

# add line plot with number of alive trees
lines(trees_county$trees_alive ~ trees_county$year,
      type = "l",
      col = "darkgreen")

# add legend
legend("topright",
       legend = c("all trees", "alive trees"),
       col = c("black", "darkgreen"),
       lty = 1,
       title = "legend")


# alternative: dplyr & ggplot2
trees_county <- trees_subset |> filter(county_code == 1)

ggplot(trees_county, aes(x = year)) +
  geom_line(aes(y = number_trees, col = "All Trees")) +
  geom_line(aes(y = trees_alive, col = "Alive Trees")) +
  labs(y = "count")

# Create a box plot comparing species richness in the different regions. Add axes labels.
boxplot(trees_subset$species_richness ~ trees_subset$region,
        xlab = "region", ylab = "species richness")

# Alternative: ggplot2
ggplot(trees_subset, aes(x = region, y = species_richness)) +
  geom_boxplot() +
  labs(y = "species richness")

# 5. Data Wrangling

# Which region has the highest average tree height?
mean_height <- aggregate(height_m ~ region, FUN = mean, data = trees_subset)
mean_height[order(mean_height$height_m, decreasing = T), ]

# alternative: dplyr
trees_subset |> group_by(region) |>
  summarise(height = mean(height_m, na.rm = T)) |>
  arrange(dec(height))

# Which year has the lowest average percentage of alive trees?
mean_alive <- aggregate(alive ~ factor(year), FUN = mean, data = trees_subset)
mean_alive[order(mean_alive$alive), ]

# alternative: dplyr
trees_subset |> 
  group_by(year) |>
  summarise(alive = mean(alive)) |>
  arrange(alive)

#   Add a new column that has the value “warning” if there are < 10 trees in a county and the value “no warning” otherwise.
trees_subset$warning <- ifelse(trees_subset$number_trees < 10, "warning", "no warning")
 
# 6. Advanced
 
# 6.1 In what region are the most counties with less than 80% of surveyed trees alive?

# Step 1: Adding a column that records whether less than 80% of trees are alive
trees_subset$less_than_80 <- trees_subset$alive < 80

# Step 2: Grouping and calculating sum of less_than_80 column
trees_subset |> 
  group_by(region) |>
  summarise(less_than_80 = sum(less_than_80)) |>
  arrange(desc(less_than_80))

# 6.2 Select the county with the highest species richness in 2025 and plot the development 
# of species richness, number of trees, and tree height over time.

# Step 1: Determine the county
trees_2025 <- trees_subset |> filter(year == 2025)
trees_2025[trees_2025$species_richness == max(trees_2025$species_richness), ]
# -> county 79

# Step 2: Create subset of that county
trees_county <- trees_subset |> filter(county_code == 79)

# Step 3: Plot via for loop
par(mfrow = c(1, 3)) # set up graphics device
for(i in c(5, 3, 7)){
  plot(trees_county[, i] ~ trees_county$year,
       type = "l",
       xlab = "year",
       ylab = names(trees_county)[i])
}
par(mfrow = c(1, 1)) # reset graphics device

# What counties had the highest decline of species richness from 2010 to 2025?
# (Not including counties where data is unavailable for 2010 and/or 2025).

# Step 1: Create subsets of data from 2010 & 2025 
trees_2010 <- trees_subset[trees_subset$year == 2010, ]
trees_2025 <- trees_subset[trees_subset$year == 2025, ]

# Step 2: Merge the two data frames (inner merge)
trees_merged <- merge(trees_2010, trees_2025, by = "county_code")

# Step 3: Calculate decline
trees_merged$decline <- trees_merged$species_richness.y - trees_merged$species_richness.x

# Step 4: Identify counties with highest decline (negative value -> high decline in this case)
head(trees_merged[order(trees_merged$decline), ])