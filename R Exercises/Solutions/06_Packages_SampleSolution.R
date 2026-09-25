## ---------------------------------------------------
## Preparatory R Course - Topic 6
## Packages
## Exercises
## ---------------------------------------------------
##


# 1. Lubridate --------------------------------------------------------

# 1.1 Install and load lubridate (if not already done).
install.packages("lubridate")
library(lubridate)

# 1.2 Load the file weather_goettingen.csv.
weather <- read.csv("data/weather_goettingen.csv")

# 1.3 Convert the Time column into the date format using lubridate.
weather$Time <- dmy_hm(weather$Time)

# 1.4 Plot radiation over time.
plot(weather$Radiation ~ weather$Time,
     type = "l",
     xlab = "Time",
     ylab = "Radiation")


# 2. ggplot2 --------------------------------------------------------------

# 2.1 Install and load ggplot 2 (if not already done).
install.packages(ggplot2)
library(ggplot2)

# 2.2 Read in the trees louisiana dataset with the adjusted units you created yesterday.
# Alternatively, read in "trees_louisiana_units.csv" from the data folder.

trees <- read.csv("data/trees_louisiana_units.csv")

# 2.3 Use ggplot2 to create a scatterplot of diameter against tree height.
ggplot(trees, aes(x = height, y = diameter)) +
  geom_point()

# 2.4 Use ggplot2 to create a scatterplot of diameter against tree height with points colored
# by species. Add axes labels and an appropiate legend.
ggplot(trees, aes(x = height, y = diameter, col = species)) +
  geom_point() +
  labs(x = "height [m]", y = "diameter [cm]")

# 2.5 Use ggplot2 to create a box plot of diameter by species with appropiate axes labels.
ggplot(trees, aes(x = species, y = diameter)) +
  geom_boxplot() +
  labs(y = "diameter [cm]")

# 2.6 Reflect: do you prefer base R or ggplot2 for plotting? What are benefits/downsides
# of each? (no right or wrong answer!)


# 3. Advanced -------------------------------------------------------------

data("airquality")
?airquality

# 3.1 Add a date column to the airquality dataset (hint: use lubridate::make_datetime).
airquality$date <- make_datetime(year = 1973, month = airquality$Month, day = airquality$Day)

# 3.2 Create a line plot of Ozone concentration over time.
ggplot(airquality, aes(x = date, y = Ozone)) +
  geom_line()

# 3.3 Adjust axes labels and change the font size of axes labels to 20 pt.
ggplot(airquality, aes(x = date, y = Ozone)) +
  geom_line() +
  labs(y = "ozone [ppb]") +
  theme(axis.title = element_text(size = 20))

# 3.4 Add an appropiate title and change the font size to 30 pt.
ggplot(airquality, aes(x = date, y = Ozone)) +
  geom_line() +
  labs(y = "ozone [ppb]", title = "Ozone concentration 1973") +
  theme(axis.title = element_text(size = 20),
        title = element_text(size = 30))

# 3.5 Create a scatter plot of temperature against wind. Create
# a seperate plot for each month.
ggplot(airquality, aes(x = Temp, y = Wind)) +
  geom_point() +
  labs(x = "temperature [F]", y = "wind speed [mph]") +
  facet_wrap(~ Month)
