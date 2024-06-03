library(tidyverse)
library(tidymodels)
options(repr.matrix.max.rows = 6)

# Data on cancer tumors
tumors <- read_csv("data/clean-wdbc.data.csv") |>
    mutate(Class = as_factor(Class))

tumors

tumors |> head(2)

# Standardize the cancer data

tumor_recipe <- recipe(Class ~ Perimeter + Concavity, data = tumors) |>
                  step_center(all_predictors()) |>
                  step_scale(all_predictors())
tumor_recipe

# Build a model specification using nearest_neighbor

tumor_model <- nearest_neighbor(weight_func = "rectangular", neighbors = 3) |>
       set_engine("kknn") |>
       set_mode("classification")

tumor_model

# Create a workflow

tumor_workflow <- workflow() |>
    add_recipe(tumor_recipe) |>
    add_model(tumor_model)

tumor_fit <- tumor_workflow |>
    fit(data = tumors)

tumor_workflow

new_obs <- tibble(Perimeter = 0.2, Concavity = 3.3)

predict(tumor_fit, new_obs)

head(iris)
options(repr.plot.width = 6, repr.plot.height = 3)
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, color = Species)) +
    geom_point() +
    labs( x= "Petal Length (cm)", y = "Petal Width (cm)")
