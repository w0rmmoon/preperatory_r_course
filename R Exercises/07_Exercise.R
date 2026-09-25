## ---------------------------------------------------
## Preparatory R Course - Topic 7
## Data Wrangling
## Exercises
## ---------------------------------------------------
##

# For the following exercises, use either base R or dplyr
# based on your personal preference.


# 1. Data Preperation ------------------------------------------------------

# 1.1 Read in the file land-use-change.csv from the data folder. The file contains
# annual CO2 emissions from land use change per country.

# 1.2 Rename the column holding the CO2 emissions from land use change to
# a sensible name of your choice.

# 1.3 Create a subset with only data from 2020 or later.


# 2. Grouping -------------------------------------------------------------

# 2.1 Calculate the average CO2 emission from land use change per year (1850 - 2020).

# 2.2 Calculate the total CO2 emissions per country from land use change for the 2020 to 2024 period.


# 3. Merging --------------------------------------------------------------

# 3.1 Read in the file annual-co2-emissions.csv from the data folder.

# 3.2 Create a subset of both the total emissions and the landuse emissions file with only
# the year 2024.

# 3.3 Drop the "Year" and the "Code" column from both data frames.

# 3.4 Merge the two data frames by country name. Only retain countries that are included in the landuse emissions file.

# 3.5 Create a scatter plot of landuse emissions against total emissions.


# 4. Advanced: Reshaping Data ---------------------------------------------

# 4.1 Reshape the landuse emissions (subselection 2020 - 2024) file so there is one row per year and one column for each country's emissions.

