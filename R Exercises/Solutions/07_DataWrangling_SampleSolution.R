## ---------------------------------------------------
## Preparatory R Course - Topic 7
## Data Wrangling
## Exercises
## ---------------------------------------------------
##

library(dplyr)
library(tidyr) # optional, only required for advanced exercises

# For the following exercises, use either base R or dplyr
# based on your personal preference.


# 1. Data Preperation ------------------------------------------------------

# 1.1 Read in the file land-use-change.csv from the data folder. The file contains
# annual CO2 emissions from land use change per country.
land_use_change <- read.csv("data/land-use-change.csv")

# 1.2 Rename the column holding the CO2 emissions from land use change to
# a sensible name of your choice.
names(land_use_change)[4] <- "landuse_emissions"

# alternative
land_use_change <- land_use_change |> rename(
  landuse_emissions = Annual.CO..emissions.from.land.use.change
)

# 1.3 Create a subset with only data from 2020 or later.
land_use_change_2020 <- land_use_change[land_use_change$Year >= 2020, ]

# alternative:
land_use_change_2020 <- land_use_change_2020 |> filter(Year >= 2020)

# 2. Grouping -------------------------------------------------------------

# 2.1 Calculate the average CO2 emission from land use change per year (1850 - 2020).
aggregate(land_use_change$landuse_emissions ~ land_use_change$Year, FUN = mean)

# alternative:
land_use_change |> group_by(Year) |> summarise(emissions = mean(landuse_emissions))

# 2.2 Calculate the total CO2 emissions per country from land use change for the 2020 to 2024 period.
aggregate(land_use_change_2020$landuse_emissions ~ land_use_change_2020$Entity, FUN = sum)

# alternative:
land_use_change_2020 |> group_by(Entity) |> summarise(emissions = sum(landuse_emissions))

# 3. Merging --------------------------------------------------------------

# 3.1 Read in the file annual-co2-emissions.csv from the data folder.
emissions_total <- read.csv("data/annual-co2-emissions.csv")

# 3.2 Create a subset of both the total emissions and the landuse emissions file with only
# the year 2024.
emissions_2024 <- emissions_total[emissions_total$Year == 2024, ]
landuse_2024 <- land_use_change[land_use_change$Year == 2024, ]

# alternative
emissions_2024 <- emissions_total |> filter(Year == 2024)
landuse_2024 <- land_use_change |> filter(Year == 2024)

# 3.3 Drop the "Year" and the "Code" column from both data frames.
emissions_2024 <- emissions_2024[, c(1, 4)]
landuse_2024 <- landuse_2024[, -c(2, 3)] # alternatively removing columns via -

# alternative
emissions_2024 <- emissions_2024 |> select(Annual.CO..emissions, Entity)
landuse_2024 <- landuse_2024 |> select(-c(Year, Code)) # or via -

# 3.4 Merge the two data frames by country name. Only retain countries that are included in the landuse emissions file.
data_merged <- merge(x = landuse_2024, y = emissions_2024, by = "Entity", all.x = T)

# alternative
data_merged <- left_join(x = landuse_2024, y = emissions_2024, by = "Entity")

# 3.5 Create a scatter plot of landuse emissions against total emissions.
ggplot(data_merged, aes(x = Annual.CO..emissions, y = landuse_emissions)) +
  geom_point() +
  labs(x = "Total emissions", y = "Emissions from land use")

# 4. Advanced: Reshaping Data ---------------------------------------------

# 4.1 Reshape the landuse emissions (subselection 2020 - 2024) file so there is one row per year and one column for each country's emissions.

landuse_wider <- land_use_change_2020 |> 
  pivot_wider(id_cols = Year, names_from = Entity, values_from = landuse_emissions)

