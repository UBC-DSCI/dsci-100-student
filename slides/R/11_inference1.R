# run before presenting to create population
# create virtual box
options(repr.matrix.max.rows = 6)
library(tidyverse)
set.seed(1)
virtual_ugrads <- tibble(student_id = seq(1, 50000, by = 1),
                     phone_type = factor(rbinom(50000, 1, 0.63),
                     labels = c("other", "iphone")))

# load libraries for wrangling and plotting
library(dplyr)
library(infer)

virtual_ugrads

virtual_ugrads |> 
    group_by(phone_type) |> 
    summarize(count = n(),
             proportion = n() / 50000)

# draw a single sample from the virtual population
student_sample <- rep_sample_n(virtual_ugrads, size = 40)
student_sample

# compute the proportion of iPhone users
iphone_estimate_1 <- summarize(student_sample,
                               count = sum(phone_type == "iphone"),
                               prop = sum(phone_type == "iphone") / 40)
iphone_estimate_1

# random sample from virtual population
iphone_estimate_2 <- rep_sample_n(virtual_ugrads, size = 40) |> 
    summarize(count = sum(phone_type == "iphone"),
              prop = sum(phone_type == "iphone") / 40)
iphone_estimate_2

# random sample from virtual student population
iphone_estimate_3 <- rep_sample_n(virtual_ugrads, size = 40) |>
    summarize(count = sum(phone_type == "iphone"),
              prop = sum(phone_type == "iphone") / 40)
iphone_estimate_3

iphone_estimate_1
iphone_estimate_2
iphone_estimate_3

# take many samples from virtual student population
replicates <- rep_sample_n(virtual_ugrads, size = 40, reps = 10000) |>
   group_by(replicate)  |> 
   summarize(proportion = sum(phone_type == "iphone")/40)

ggplot(replicates, aes(x = proportion)) +
    geom_histogram(binwidth = .05) +
    labs(x = "Proportion of iPhone Users", y = "Count") +
    theme(text = element_text(size=20))