# Step 1: Navigate to the file and see what it looks like

my_url <- 'https://raw.githubusercontent.com/UBC-DSCI/dsci-100-student/master/slides/R/data/faithful.dat'

# Step 2: Prepare to load the data into R

# Load the tidyverse package which contains all the `read_*` functions
options(repr.matrix.max.rows = 6)
library(tidyverse)

# Optional: Download the file locally first
dir.create("data")
download.file(my_url, 'data/faithful.dat')

read_delim('data/faithful.dat')

read_delim('data/faithful.dat', skip = 25)

read_delim(
    'data/faithful.dat',
    skip = 25,
    col_names = c('index', 'eruption_time', 'waiting_time')
)

read_delim(
    'data/faithful.dat',
    skip = 26,
    col_names = c('index', 'eruption_time', 'waiting_time')
)

read_delim(
    'data/faithful.dat',
    skip = 26,
    delim = " ",
    col_names = c('index', 'eruption_time', 'waiting_time')
)

