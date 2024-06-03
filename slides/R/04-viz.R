# Run before lecture to load datasets and do simple prep
library(tidyverse) #all our data wrangling/plotting
options(repr.matrix.max.rows = 6)
# Making scatter points a bit bigger so that students can see them
update_geom_defaults("point", list(size = 3))

#Mauna Loa
co2_df <- tibble(
    concentration = as.vector(co2),
    date = lubridate::date_decimal(as.numeric(time(co2)))
)

#Top 12 Island landmasses
islands_df <- enframe(islands)
colnames(islands_df) <- c('landmass', 'size')
islands_df = top_n(islands_df, 12, size)

continents <- c('Africa', 'Antarctica', 'Asia', 'Australia', 'Europe', 'North America', 'South America')
islands_df <- mutate(islands_df, is_continent = ifelse(landmass %in% continents, 'Continent', 'Other'))


gapminder <- read_csv("data/gapminder.csv")
gapminder_2016 <- gapminder  |>
    select(country, year, continent, life_expectancy) |>
    filter(year == 2016)

#old faithful, mtcars -- nothing to do


# Load libraries for wrangling and plotting
library(tidyverse)

# Inspect the data
mtcars

# Set the default size for all plots
options(repr.plot.width = 10, repr.plot.height = 8)

# Is there a relationship between fuel economy and horsepower?

# Base
ggplot(mtcars, aes(x = hp, y = mpg)) +
    geom_point()

# It's difficult to see the text so let's make it bigger
theme(text = element_text(size = 26))

# Color per cylinder
ggplot(mtcars, aes(x = hp, y = mpg, color = cyl))

# Change color to factor/categorical
ggplot(mtcars, aes(x = hp, y = mpg, color = factor(cyl)))

# Add labels
labs(x='Horsepower', y='Miles per Gallon', color='Cylinders')

# Full final plot
ggplot(mtcars, aes(x = hp, y = mpg, color = factor(cyl))) +
    geom_point() +
    theme(text = element_text(size = 26)) +
    labs(x='Horsepower', y='Miles per Gallon', color='Cylinders')

# Inspect the data
co2_df

# Change the default text size for all plots
theme_set(theme_gray(base_size = 26))

# How does atmospheric CO2 concentration change over time?

ggplot(co2_df, aes(x=date, y=concentration)) +
    geom_point()

ggplot(co2_df, aes(x=date, y=concentration)) +
    geom_line()

ggplot(co2_df, aes(x=date, y=concentration)) +
    geom_line() +
    labs(x = 'Date', y = 'CO2 Concentration')

# Inspect the data
islands_df

# What are the largest 12 island landmasses on Earth?

ggplot(islands_df, aes(x = landmass, y = size)) +
    geom_bar()

ggplot(islands_df, aes(x = is_continent)) +
    geom_bar()

ggplot(islands_df, aes(x = landmass, y = size)) +
    geom_bar(stat = 'identity')

ggplot(islands_df, aes(x = size, y = landmass)) +
    geom_bar(stat = 'identity')

ggplot(islands_df, aes(x = size, y = reorder(landmass, -size))) +
    geom_bar(stat = 'identity')

# Inspect the data
gapminder_2016

# Was there a difference in life expectancy across different continents in 2016?

ggplot(gapminder_2016, aes(x = life_expectancy)) +
    geom_histogram()

ggplot(gapminder_2016, aes(x = life_expectancy, fill = continent)) +
    geom_histogram()

ggplot(gapminder_2016, aes(x = life_expectancy, fill = continent)) +
    geom_histogram(position = "identity", alpha = 0.6)

ggplot(gapminder_2016, aes(x = life_expectancy, fill = continent)) +
    geom_histogram() +
    facet_grid(rows = vars(continent))

options(repr.plot.width = 10, repr.plot.height = 12)
ggplot(gapminder_2016, aes(x = life_expectancy, fill = continent)) +
    geom_histogram() +
    facet_grid(rows = vars(continent)) +
    labs(x = "Life Expectancy (years)", y = "Count", fill = "Continent")

options(repr.plot.width = 4, repr.plot.height = 4)
diamond_plot <- ggplot(diamonds, aes(x = carat, y = price)) +
    geom_point() +
    xlab("Size (carat)") +
    ylab("Price (US dollars)")
diamond_plot
