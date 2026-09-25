## ---------------------------------------------------
## Preparatory R Course - Topic 4: Exercises
## ---------------------------------------------------
##


# 1. Working Directory & Projects -------------------------------------------------------------

# 1.1 Create a project for the class (if you haven't done so already).
# Create a project under File -> New Project...

# 1.2 What is your current working directory?
getwd()


# 2. Reading & Writing Data ---------------------------------------------------------

# The file you are about to read in describes trees measured in Louisiana, USA from
# 2023 to 2025 for the US National Forest Inventory. Check trees_louisiana_metadata.txt 
# in the data folder for detailed info on the data source and columns.

# 2.1 Read in the file trees_louisiana.csv from the data folder.
trees <- read.csv("data/trees_louisiana.csv")

# 2.2 Gain a first overview of the data by inspecting its structure, summary...
str(trees)

summary(trees)

# 2.3 The diameter is given in inches and the height in feet. Convert both into
# cm and m.
trees$height_m <- trees$height * 0.3048
trees$diameter_cm <- trees$diameter * 2.54

# 2.4 Export your file with the converted units as a csv.
write.csv(trees, "data/trees_units.csv")
