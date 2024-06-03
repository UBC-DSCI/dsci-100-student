library(tidyverse)
library(palmerpenguins)
options(repr.matrix.max.rows = 6)

penguins

# Recall which column names we have
penguins

# Start with selecting one column
select(penguins, bill_length_mm)

# Select many columns
select(penguins, bill_length_mm,	bill_depth_mm,	flipper_length_mm,	body_mass_g)

# Assign selection
penguins_select <- select(penguins, bill_length_mm,	bill_depth_mm,	flipper_length_mm,	body_mass_g)
penguins_select

# Select all except specfic columns
select(penguins, -island, -species, -sex, -year)

select(penguins, starts_with('bill_'))

penguins

# One condition
filter(penguins, flipper_length_mm > 190)

# Two conditions
filter(penguins, flipper_length_mm > 190 & species == 'Chinstrap')

# Recall that 454 g is 1 lbs
mutate(penguins, body_mass_lbs = body_mass_g / 454)

# The above creates a new dataframe, it does not save it to the original `penguins` df
penguins

# We need to assign it to a new variable if we want to save it
penguins_lbs <- mutate(penguins, body_mass_lbs = body_mass_g / 454)

penguins_1 <- mutate(penguins, body_mass_lb = body_mass_g/454)
penguins_2 <- filter(penguins_1, flipper_length_mm > 190)
penguins_3 <- select(penguins_2, bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_lb)
penguins_3

penguins_composed <- select(
    filter(
        mutate(
            penguins, body_mass_lb = body_mass_g/454
        ),
        flipper_length_mm > 190
    ),
    bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_lb
)
penguins_composed

penguins_piped <- penguins |>
    mutate(body_mass_lb = body_mass_g/454) |>
    filter(flipper_length_mm > 190) |>
    select(bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_lb)
penguins_piped

# Recall the data structure
penguins

# Calculate the average body mass for each species

penguins |>
    group_by(species) |>
    summarize(avg_body_mass = mean(body_mass_g))

# Calculate average body mass for each species handling NA's:

penguins |>
    group_by(species) |>
    summarize(avg_body_mass = mean(body_mass_g, na.rm = TRUE))

# Count NA's

penguins |>
    summarize(num_nas = sum(is.na(body_mass_g)))

# Calculate average each numeric column in penguins data set

# returns a df
penguins |>
    select(bill_length_mm:body_mass_g) |>
    map_df(mean, na.rm = TRUE)

# returns a list
penguins |>
    select(bill_length_mm:body_mass_g) |>
    map(mean, na.rm = TRUE) #|>
#    class()

penguins |>
    select(bill_length_mm:body_mass_g) |>
    summarize(
        mean(bill_length_mm, na.rm = TRUE),
        mean(bill_depth_mm, na.rm = TRUE),
        mean(flipper_length_mm, na.rm = TRUE),
        mean(body_mass_g, na.rm = TRUE)
    )
