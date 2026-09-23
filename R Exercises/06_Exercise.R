## ---------------------------------------------------
## Preparatory R Course - Topic 6
## Packages
## Exercises
## ---------------------------------------------------
##


# 1. Lubridate --------------------------------------------------------

# 1.1 Install and load lubridate (if not already done).

# 1.2 Load the file weather_goettingen.csv.

# 1.3 Convert the Time column into the date format using lubridate.

# 1.4 Plot radiation over time.


# 2. ggplot2 --------------------------------------------------------------

# 2.1 Install and load ggplot 2 (if not already done).

# 2.2 Read in the trees louisiana dataset with the adjusted units you created yesterday.
# Alternatively, read in "trees_louisiana_units.csv" from the data folder.

# 2.3 Use ggplot2 to create a scatterplot of diameter against tree height.

# 2.4 Use ggplot2 to create a scatterplot of diameter against tree height with points colored
# by species. Add axes labels and an appropiate legend.

# 2.5 Use ggplot2 to create a box plot of diameter by species with appropiate axes labels.

# 2.6 Reflect: do you prefer base R or ggplot2 for plotting? What are benefits/downsides
# of each? (no right or wrong answer!)


# 3. Advanced -------------------------------------------------------------

data("airquality")
?airquality

# 3.1 Add a date column to the airquality dataset (hint: use lubridate::make_datetime).

# 3.2 Create a line plot of Ozone concentration over time.

# 3.3 Adjust axes labels and change the font size of axes labels to 20 pt.

# 3.4 Add an appropiate title and change the font size to 30 pt.

# 3.5 Create a scatter plot of temperature against wind. Create
# a seperate plot for each month (hint: use ggplot2::facet_wrap()!).