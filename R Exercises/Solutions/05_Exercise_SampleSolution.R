## ---------------------------------------------------
## Preparatory R Course - Topic 5
## Plotting in Base R
## Exercises
## ---------------------------------------------------
##


# 1. Scatter Plots --------------------------------------------------------


# 1.1 Read in the trees louisiana dataset with the adjusted units you created yesterday.
# Alternatively, read in "trees_louisiana_units.csv" from the data folder.
trees <- read.csv("data/trees_louisiana_units.csv")

# 1.2 Plot tree diameter against tree height in a scatter plot and adjust axes labels.
plot(trees$diameter ~ trees$height,
     xlab = "height [m]",
     ylab = "diameter [cm]")

# alternative solution:
plot(x = trees$height, y = trees$diameter,
     xlab = "height [m]",
     ylab = "diameter [cm]")

# 1.3 Change the color based on species and add an appropiate legend.
colors_species <- c("blue", "green", "red") # create color vector
trees$species <- factor(trees$species) # change species to factor

plot(trees$diameter ~ trees$height,
     xlab = "height [m]",
     ylab = "diameter [cm]",
     col = colors_species[trees$species])

# add the legend
legend("topleft",
       legend = levels(trees$species),
       col = colors_species,
       pch = 1,
       title = "legend")

# 1.4 Export your plot as a png.

png(filename = "plot_trees.png")
plot(trees$diameter ~ trees$height,
     xlab = "height [m]",
     ylab = "diameter [cm]",
     col = colors_species[trees$species])

# add the legend
legend("topleft",
       legend = levels(trees$species),
       col = colors_species,
       pch = 1,
       title = "legend")

dev.off()

# 2. Additional Plot Types ------------------------------------------------------------

# 2.1 Create a box plot of tree diameter by species, including axes labels.
boxplot(trees$diameter ~ trees$species,
        xlab = "species", ylab = "diameter [cm]")

# 2.2 Plot a histogram of the tree height.
hist(trees$height, xlab = "height [m]")

# 2.3 Add a vertical line at the location of the mean tree height to the histogram.
abline(v = mean(trees$height, na.rm = T), col = "red")


# 3. Advanced -------------------------------------------------------------

# 3.1 Plot the same histogram as before with the probability density on the y axis.
hist(trees$height, freq = F)

# 3.2 Overlay a normal distribution ("bell curve") with the mean and standard deviation
# of the tree height over the histogram. Hint: Use the functions curve() and dnorm().
curve(dnorm(x, mean = mean(trees$height, na.rm = T), sd = sd(trees$height, na.rm = T)), add = T)

# If you are unfamiliar with the normal distribution, don't worry! It will be covered
# in the first semester and it not required prerequisite knowledge. 

