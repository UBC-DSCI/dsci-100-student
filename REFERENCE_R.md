# DSCI 100 function reference sheet for R

This reference sheet contains the key objects that we use in DSCI 100, and a brief syntax example for each of the main packages. During the closed book exams, you will still have access to this page, so get familiar with it already now. There is no guarantee that every function or parameter in the textbook is covered here, but if you think there is something missing, please let us know and we can consider adding it.

## Base R Operations

| Function                          | Description                                                |
| --------------------------------- | ---------------------------------------------------------- |
| `abs(x)`                          | Convert numeric value(s) to absolute value                 |
| `as.data.frame(x)`                | Converts an object to a data frame                         |
| `as.numeric(x)`                   | Converts a variable to a numeric data type                 |
| `c(1,2,3)`                        | Combines values into a vector or list in R                 |
| `is.na(column)`                   | Detect missing (NA) values in a vector or data frame       |
| `dim(column)`                     | Returns dimensions (rows and columns) of an R object       |
| `max(column)`                     | Returns maximum value in a numeric vector                  |
| `mean(column)`                    | Returns average value in a numeric vector                  |
| `median(column)`                  | Returns the median value in a numeric vector               |
| `min(column)`                     | Returns minimum value in a numeric vector                  |
| `n()`                             | Counts the number of rows in a table's group               |
| `names(tbl)`                      | Assigns or retrieves names of elements in an R object      |
| `ncol(tbl)`                       | Returns the number of columns in a matrix/data frame       |
| `nrow(tbl)`                       | Returns the number of rows in a matrix/data frame          |
| `print(x)`                        | Displays specified object's value                          |
| `round(num, digits)`              | Rounds a number to specified decimals                      |
| `sd(column)`                      | Calculates standard deviation for numeric data             |
| `seq(from = 1, to = 5, by = 0.5)` | Generates a sequence of numbers                            |
| `sum(column)`                     | Calculates the sum of numeric values in a vector or matrix |
| `sort(df)`                        | Sorts a vector or data frame in ascending order            |
| `sqrt(num)`                       | Computes the square root of a numeric value                |

## Operators

| Function | Description                                            |
| -------- | ------------------------------------------------------ |
| `==`     | Compares two values and returns TRUE if they are equal |
| `%in%`   | Checks if elements on the left side are in the right   |
| `!`      | Negates a logical value (!TRUE is FALSE)               |
| `&`      | Performs element-wise logical AND operations           |
| `\|`     | Represents the OR logical operator                     |
| `\|>`    | Pipe operator, which passes data from left to right    |

## Data Reading

| Function                       | Description                                    |
| ------------------------------ | ---------------------------------------------- |
| `download.file(url, destfile)` | Download a file from the web                   |
| `read_csv(filepath)`           | Reads comma-separated values into a data frame |
| `read_csv2(filepath)`          | Reads CSV files with semicolon delimiter       |
| `read_delim(filepath, delim)`  | Reads data from a delimited text file          |
| `read_excel(filepath)`         | Reads Excel files into R data frames           |
| `read_html(filepath)`          | Reads and parses HTML web pages                |
| `read_tsv(filepath)`           | Reads tab-separated values into a data frame   |
| `write_csv(tbl, filepath)`     | Writes data to a CSV file                      |

Database functions

| Function                                     | Description                                         |
| -------------------------------------------- | --------------------------------------------------- |
| `dbConnect(RSQLite::SQLite(), db_path)`      | Establishes a connection to a database              |
| `dbListTables(dbConnect_object)`             | Lists tables in a database connection               |
| `Postgres()`                                 | Connects to and interacts with PostgreSQL databases |
| `SQLite()`                                   | Access and manage SQLite database connections       |
| `tbl(dbConnect_object, dbListTables_output)` | Creates a data frame from a data source             |

## Data Wrangling

| Function                              | Description                                    |
| ------------------------------------- | ---------------------------------------------- |
| `across`                              |                                                |
| `as_datetime`                         |                                                |
| `as_factor`                           |                                                |
| `as_tibble`                           |                                                |
| `arrange`                             |                                                |
| `collect`                             |                                                |
| `colnames`                            |                                                |
| `desc`                                |                                                |
| `everything`                          |                                                |
| `filter`                              |                                                |
| `fct_reorder`                         |                                                |
| `group_by(tbl, columns_as_arguments)` | Group a tibble by the list of columns provided |
| `head`                                |                                                |
| `if_else`                             |                                                |
| `map`                                 |                                                |
| `map_chr`                             |                                                |
| `map_df`                              |                                                |
| `mutate`                              |                                                |
| `pivot_longer`                        |                                                |
| `pivot_wider`                         |                                                |
| `pull`                                |                                                |
| `rowwise`                             |                                                |
| `select`                              |                                                |
| `semi_join`                           |                                                |
| `separate`                            |                                                |
| `slice`                               |                                                |
| `slice_max`                           |                                                |
| `slice_min`                           |                                                |
| `str_extract`                         |                                                |
| `str_replace_all`                     |                                                |
| `summarise`                           |                                                |
| `summarize`                           | Same as `summarise`                            |
| `tail`                                |                                                |
| `tibble`                              |                                                |
| `tolower`                             |                                                |
| `toupper`                             |                                                |
| `ungroup`                             |                                                |
| `unique`                              |                                                |
| `unlist`                              |                                                |
| `unnest`                              |                                                |
| `vars`                                |                                                |

## Visualization

A typical `ggplot2` syntax for creating a new chart looks something like this:

```
library(tidyverse)

my_data |> ggplot(aes(x = column1, y = column2)) +
  geom_point()
```

| Function                         | Description                                                                          |
| -------------------------------- | ------------------------------------------------------------------------------------ |
| `aes(x, y, ...)`                 | Specifies how variables in the data are mapped to properties of the plot             |
| `element_blank()`                | Used with `theme` system to draw nothing or assign no space (leave blank)            |
| `element_text(size, colour)`     | Used with `theme` system to control text size, colour, etc.                          |
| `facet_grid(rows, cols)`         | Creates matrix panels with plots based on specified rows or cols variable            |
| `facet_wrap(facets)`             | Creates a ribbon of panels wrapped in 2d using specified facets                      |
| `geom_abline(slope, intercept)`  | Adds a diagonal line to the plot with specified intercept and slope                  |
| `geom_bar(stat)`                 | Used to create bar graphs with specified `stat` (often "identity" or "count")        |
| `geom_density()`                 | Used to create a smoothened line version of a histogram                              |
| `geom_freqpoly()`                | Used to create a lined (not smooth) version of a histogram                           |
| `geom_histogram(bins, binwidth)` | Creates histogram plots with a specified number of bins and bin width                |
| `geom_line()`                    | Adds lines to connect data points in the order of the x-axis                         |
| `geom_point()`                   | Used to create a scatterplot graphs                                                  |
| `geom_segment(x, y, xend, yend)` | Draws a straight line on plot connecting (x, y) to (xend, yend)                      |
| `geom_vline(xintercept)`         | Adds a vertical line to the plot at the specified x-intercept                        |
| `ggmap(map)`                     | Used to display visual maps from Google Maps or Stamen Maps                          |
| `ggpairs(tbl)`                   | Plots each variables against all the other variables in a scatterplot matrix         |
| `ggplot(tbl, mapping)`           | Initialize a `ggplot` object, specifying the data and aesthetic mapping for the plot |
| `ggsave(filename, plot)`         | Saves specified plot with given filename to device                                   |
| `ggtitle(title)`                 | Adds specified title to the plot                                                     |
| `labs(x, y, fill, colour, ...)`  | Modifies labels on the plot, specifying what the new labels should be                |
| `scale_color_manual(values)`     | Manually change the colour for plots by specifying the values                        |
| `scale_fill_brewer(palette)`     | Changes the fill colour palette to the specified palette                             |
| `scale_fill_distiller(palette)`  | Changes the fill colour palette for continuous scales                                |
| `scale_x_continuous(limits)`     | Customize x-axis scales for continuous x variables with specified options            |
| `scale_x_date(limits, breaks)`   | Customize the x-axis scales for date or time variables in a plot                     |
| `scale_y_continuous(limits)`     | Customize y-axis scales for continuous y variables with specified options            |
| `theme(text) `                   | Used to modify the non-data components of the plot with specified options            |
| `theme_bw()`                     | Uses the classic dark-on-light theme for the plot                                    |
| `theme_minimal()`                | Uses a minimalistic theme that does not have background annotations for the plot     |
| `xlab(label)`                    | Modifies the x-axis label to the specified label                                     |
| `xlim(lo, hi)`                   | Displays only the specified range on the x-axis of the plot                          |
| `ylab(label)`                    | Modifies the y-axis label to the specified label                                     |
| `ylim(lo, hi)`                   | Displays only the specified range on the y-axis of the plot                          |

## Modeling

A typical `tidymodels` workflow looks something like this:

```
library(tidymodels)

knn_fit <- workflow() |>
  add_recipe(my_recipe) |>
  add_model(knn_spec) |>
  fit(data = my_data)

pred <- predict(knn_fit, new_data)
```

| Function                                   | Description                                                                               |
| ------------------------------------------ | ----------------------------------------------------------------------------------------- |
| `add_model(workflow, model_spec)`          | Add a model to a workflow                                                                 |
| `add_recipe(workflow, model_recipe)`       | Add a recipe to a workflow                                                                |
| `add_row(data, col1, col2)`                | Add rows to a dataframe                                                                   |
| `all_predictors()`                         | Select all predictors                                                                     |
| `apparent(data)`                           | Sampling for the apparent error rate                                                      |
| `augment(fit, data)`                       | Add predictions/residuals/cluster assignments to dataframe                                |
| `bake(recipe, data)`                       | Applies the results of prep() into the data                                               |
| `bind_cols(df1, df2)`                      | Combine multiple dataframes together                                                      |
| `collect_metrics(fitted_model)`            | Aggregate the mean and standard error of the model's accuracy across the folds            |
| `conf_mat(data, truth, estimate)`          | Computes and returns the confusion matrix                                                 |
| `dist(data, method)`                       | Computes and returns the distance matrix                                                  |
| `as_factor(data, variable)`                | Converts a variable to a factor type                                                      |
| `fit(model, data)`                         | Add data to a workflow to build a fitted model                                            |
| `fit_resamples(model, resamples)`          | Runs cross-validation on each train/validation split to build a fitted model              |
| `glance(fitted_model)`                     | Obtain total WSSD of a cluster model                                                      |
| `initial_split(data, prop, strata)`        | Splits the data                                                                           |
| `k_means(num_clusters)`                    | Specify that the model is kmeans clustering                                               |
| `kmeans(data, centers, nstart)`            | Runs k-means clustering on the given data for the specified number of clusters and starts |
| `list(objects)`                            | Create a list of elements of different types                                              |
| `linear_reg()`                             | Specify that the model is linear regression                                               |
| `metrics(data, truth, estimate)`           | Returns the model's accuracy metrics                                                      |
| `predict(fitted_model, new_obs)`           | Predict values based on model and data                                                    |
| `prep(recipe)`                             | Prepares data for preprocessing                                                           |
| `testing(data)`                            | extract testing data                                                                      |
| `training(data)`                           | extract training data                                                                     |
| `tune()`                                   | Tune neighbors                                                                            |
| `tune_cluster(model, resamples, grid)`     | Run kmeans on multimple resamples of data                                                 |
| `tune_grid(model, resamples, grid)`        | Fit the model for each value in a range of parameter values                               |
| `nearest_neighbor(weight_func, neighbors)` | Specify that the model is K-Nearest-Neighbor                                              |
| `recipe(formula, data)`                    | Prepares data for modelling                                                               |
| `set_engine(engine)`                       | Specify package to fit the model                                                          |
| `set_mode(mode)`                           | Specify modelling context used                                                            |
| `set.seed(n)`                              | Avoid randomization                                                                       |
| `step_center(recipe)`                      | Center variables in recipe                                                                |
| `step_rm(recipe)`                          | Removes specified variables                                                               |
| `step_scale(recipe)`                       | Scale variables in recipe                                                                 |
| `vfold_cv(data, v, strata)`                | Perform cross validation                                                                  |
| `workflow()`                               | Create workflow                                                                           |

## Inference

| Function                                 | Description                                                                 |
| ---------------------------------------- | --------------------------------------------------------------------------- |
| `quantile(data, percentiles)`            | Finds the specified percentiles in the given data                           |
| `rep_sample_n(tbl, size, reps, replace)` | Takes samples of the table according to the size, reps, and replace options |
| `sample_n(tbl, num)`                     | Random selects the specified number of rows from the table                  |
