# DSCI 100 function reference sheet for R

This reference sheet contains the key objects that we use in DSCI 100, and a
brief syntax example for each of the main packages. During the closed book
exams, you will still have access to this page, so get familiar with it already
now. There is no guarantee that every function or parameter in the textbook is
covered here, but if you think there is something missing, please let us know
and we can consider adding it.

Note that we have only described use cases relevant to DSCI 100.
Sometimes we have included the exact parameter name of a function,
e.g. `print(x)`,
other times we have opted to included a more descriptive name,
e.g. `mean(column)`.

## Base R Operations

| Function             | Description                                                |
| -------------------- | ---------------------------------------------------------- |
| `abs(x)`             | Convert numeric value(s) to absolute value                 |
| `as.data.frame(x)`   | Converts an object to a data frame                         |
| `as.numeric(x)`      | Converts a variable to a numeric data type                 |
| `c(1,2,3)`           | Combines values into a vector or list in R                 |
| `is.na(column)`      | Detect missing (NA) values in a vector or data frame       |
| `dim(column)`        | Returns dimensions (rows and columns) of an R object       |
| `max(column)`        | Returns maximum value in a numeric vector                  |
| `mean(column)`       | Returns average value in a numeric vector                  |
| `median(column)`     | Returns the median value in a numeric vector               |
| `min(column)`        | Returns minimum value in a numeric vector                  |
| `n()`                | Counts the number of rows in a table's group               |
| `names(tbl)`         | Assigns or retrieves names of elements in an R object      |
| `ncol(tbl)`          | Returns the number of columns in a matrix/data frame       |
| `nrow(tbl)`          | Returns the number of rows in a matrix/data frame          |
| `print(x)`           | Displays specified object's value                          |
| `round(num, digits)` | Rounds a number to specified decimals                      |
| `sd(column)`         | Calculates standard deviation for numeric data             |
| `seq(from, to, by)`  | Generates a sequence of numbers                            |
| `sum(column)`        | Calculates the sum of numeric values in a vector or matrix |
| `sort(df)`           | Sorts a vector or data frame in ascending order            |
| `sqrt(num)`          | Computes the square root of a numeric value                |

## Operators

| Function             | Description                                            |
| -------------------- | ------------------------------------------------------ |
| `==`                 | Compares two values and returns TRUE if they are equal |
| `%in%`               | Checks if elements on the left side are in the right   |
| `!`                  | Negates a logical value (!TRUE is FALSE)               |
| `&`                  | Performs element-wise logical AND operations           |
| <code>&#124;</code>  | Represents the OR logical operator                     |
| <code>&#124;></code> | Pipe operator, which passes data from left to right    |

## Data Reading

| Function                                       | Description                                    |
| ---------------------------------------------- | ---------------------------------------------- |
| `download.file(url, destfile)`                 | Download a file from the web                   |
| `read_csv(filepath)`                           | Reads comma-separated values into a data frame |
| `read_csv2(filepath)`                          | Reads CSV files with semicolon delimiter       |
| `read_delim(filepath, delim, skip, col_names)` | Reads data from a delimited text file          |
| `read_excel(filepath)`                         | Reads Excel files into R data frames           |
| `read_html(filepath)`                          | Reads and parses HTML web pages                |
| `read_tsv(filepath)`                           | Reads tab-separated values into a data frame   |
| `write_csv(tbl, filepath)`                     | Writes data to a CSV file                      |

Database functions:

| Function                            | Description                                         |
| ----------------------------------- | --------------------------------------------------- |
| `collect(database_table)`           | Convert a database table to a tibble                |
| `dbConnect(database, dbname)`       | Establishes a connection to a database              |
| `dbListTables(dbConnect_object)`    | Lists tables in a database connection               |
| `RPostgres::Postgres()`             | Connects to and interacts with PostgreSQL databases |
| `RSQLite::SQLite()`                 | Access and manage SQLite database connections       |
| `tbl(dbConnect_object, table_name)` | Creates a data frame from a data source             |

## Data Wrangling

| Function                                                           | Description                                                           |
| ------------------------------------------------------------------ | --------------------------------------------------------------------- |
| `across(column_range, function)`                                   | Apply the given function to each column in the specified column range |
| `arrange(tibble, columns_as_arguments)`                            | Order rows by the values of the given columns (default is increasing) |
| `colnames(tbl)`                                                    | Get a list of column names from a tibble                              |
| `desc(column)`                                                     | Sort a column (or numeric vector) in descending order                 |
| `everything()`                                                     | Select all variables (used in other functions)                        |
| `filter(tbl, condition)`                                           | Keep rows that match a condition                                      |
| `fct_reorder(factor_column, ordering_column, .desc = FALSE)`       | Reorder a column by sorting according to another column               |
| `group_by(tbl, columns_as_arguments)`                              | Group a tibble by the list of columns provided                        |
| `map(tbl, function)`                                               | Apply the given function to each column, creating a list              |
| `map_chr(tbl, function)`                                           | Apply the given function to each column, creating a character vector  |
| `map_df(tbl, function)`                                            | Apply the given function to each column, creating a data frame        |
| `mutate(tbl, column_name = ...)`                                   | Create or modify a column in a tibble                                 |
| `pivot_longer(tbl, column_range, names_to = ..., values_to = ...)` | Move values from column names to cells                                |
| `pivot_wider(tbl, names_from = ..., values_from = ...)`            | Move variables from cells to column names                             |
| `pull(tbl, variable)`                                              | Extract a single variable from a tibble                               |
| `rowwise(tbl)`                                                     | Organize a tibble row-by-row for other functions                      |
| `select(tbl, columns_as_arguments)`                                | Keep the given columns                                                |
| `semi_join(tbl, joining_tbl)`                                      | Keep rows that have matching values in joining_tbl                    |
| `separate(tbl, column, into, sep)`                                 | Split values in a column into new columns based on a separator        |
| `summarize(tbl, summaries_as_arguments)`                           | Compute summary statistics on columns                                 |
| `ungroup(tbl)`                                                     | Undo the effect of group_by()                                         |

Functions used to convert one type to another:

| Function                        | Description                                         |
| ------------------------------- | --------------------------------------------------- |
| `as_datetime(formatted_string)` | Convert a string to a Date object                   |
| `as_factor(column)`             | Convert a column to a factor / categorical variable |
| `as_tibble(object)`             | Convert an object to a tibble                       |

Slicing functions:

| Function                             | Description                                            |
| ------------------------------------ | ------------------------------------------------------ |
| `head(tbl)`                          | Get the first 6 rows of a tibble                       |
| `slice(tbl, row_range)`              | Keep rows in the given range                           |
| `slice_max(tbl, ordering_column, n)` | Keep the n rows with the largest values of a variable  |
| `slice_min(tbl, ordering_column, n)` | Keep the n rows with the smallest values of a variable |
| `unique(tbl)`                        | Delete duplicate rows                                  |
| `tail(tbl)`                          | Get the last 6 rows of a tibble                        |

Functions used to manipulate strings:

| Function                                        | Description                                            |
| ----------------------------------------------- | ------------------------------------------------------ |
| `str_extract(string, pattern)`                  | Extract the first substring matching the given pattern |
| `str_replace_all(string, pattern, replacement)` | Replace all substrings matching the given pattern      |
| `tolower(string)`                               | Convert a string to all-lowercase                      |
| `toupper(string)`                               | Convert a string to all-uppercase                      |

## Visualization

A typical `ggplot2` syntax for creating a new plot looks something like this:

```
library(tidyverse)

my_data |> ggplot(aes(x = column1, y = column2)) +
  geom_point()
```

| Function                        | Description                                                                          |
| ------------------------------- | ------------------------------------------------------------------------------------ |
| `aes(x, y, ...)`                | Specifies how variables in the data are mapped to properties of the plot             |
| `element_text(size, colour)`    | Used with `theme` system to control text size, colour, etc.                          |
| `facet_grid(rows, cols)`        | Creates matrix panels with plots based on specified rows or cols variable            |
| `facet_wrap(facets)`            | Creates a ribbon of panels wrapped in 2d using specified facets                      |
| `ggmap(map)`                    | Used to display visual maps from Google Maps or Stamen Maps                          |
| `ggpairs(tbl)`                  | Plots each variables against all the other variables in a scatterplot matrix         |
| `ggplot(tbl, mapping)`          | Initialize a `ggplot` object, specifying the data and aesthetic mapping for the plot |
| `ggsave(filename, plot)`        | Saves specified plot with given filename to device                                   |
| `ggtitle(title)`                | Adds specified title to the plot                                                     |
| `labs(x, y, fill, colour, ...)` | Modifies labels on the plot, specifying what the new labels should be                |
| `scale_color_manual(values)`    | Manually change the colour for plots by specifying the values                        |
| `scale_fill_brewer(palette)`    | Changes the fill colour palette to the specified palette                             |
| `scale_fill_distiller(palette)` | Changes the fill colour palette for continuous scales                                |
| `scale_x_continuous(limits)`    | Customize x-axis scales for continuous x variables with specified options            |
| `scale_x_date(limits, breaks)`  | Customize the x-axis scales for date or time variables in a plot                     |
| `scale_y_continuous(limits)`    | Customize y-axis scales for continuous y variables with specified options            |
| `theme(text) `                  | Used to modify the non-data components of the plot with specified options            |
| `xlab(label)`                   | Modifies the x-axis label to the specified label                                     |
| `xlim(lo, hi)`                  | Displays only the specified range on the x-axis of the plot                          |
| `ylab(label)`                   | Modifies the y-axis label to the specified label                                     |
| `ylim(lo, hi)`                  | Displays only the specified range on the y-axis of the plot                          |
| `vars(columns_as_arguments)`    | Choose variables to split a plot on in `facet_grid()`                                |

Commonly used geometric objects are listed below.

| Function                         | Description                                                                   |
| -------------------------------- | ----------------------------------------------------------------------------- |
| `geom_abline(slope, intercept)`  | Adds a diagonal line to the plot with specified intercept and slope           |
| `geom_bar(stat)`                 | Used to create bar graphs with specified `stat` (often "identity" or "count") |
| `geom_density()`                 | Used to create a smoothened line version of a histogram                       |
| `geom_freqpoly()`                | Used to create a lined (not smooth) version of a histogram                    |
| `geom_histogram(bins, binwidth)` | Creates histogram plots with a specified number of bins and bin width         |
| `geom_line()`                    | Adds lines to connect data points in the order of the x-axis                  |
| `geom_point()`                   | Used to create a scatterplot graphs                                           |
| `geom_segment(x, y, xend, yend)` | Draws a straight line on plot connecting (x, y) to (xend, yend)               |
| `geom_vline(xintercept)`         | Adds a vertical line to the plot at the specified x-intercept                 |

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

The functions below are relevant for Week 7 (`classification1`) and beyond.

| Function                                   | Description                                    |
| ------------------------------------------ | ---------------------------------------------- |
| `add_model(workflow, model_spec)`          | Add a model to a workflow                      |
| `add_recipe(workflow, model_recipe)`       | Add a recipe to a workflow                     |
| `add_row(data, col1, col2)`                | Add rows to a dataframe                        |
| `all_predictors()`                         | Select all predictors                          |
| `bake(recipe, data)`                       | Applies the results of prep() into the data    |
| `bind_cols(df1, df2)`                      | Combine multiple dataframes together           |
| `dist(data, method)`                       | Computes and returns the distance matrix       |
| `as_factor(data, variable)`                | Converts a variable to a factor type           |
| `fit(model, data)`                         | Add data to a workflow to build a fitted model |
| `predict(fitted_model, new_obs)`           | Predict values based on model and data         |
| `prep(recipe)`                             | Prepares data for preprocessing                |
| `nearest_neighbor(weight_func, neighbors)` | Specify that the model is K-Nearest-Neighbor   |
| `recipe(formula, data)`                    | Prepares data for modelling                    |
| `set_engine(engine)`                       | Specify package to fit the model               |
| `set_mode(mode)`                           | Specify modelling context used                 |
| `set.seed(n)`                              | Make randomization reproducible                |
| `step_center(recipe)`                      | Center variables in recipe                     |
| `step_rm(recipe)`                          | Removes specified variables                    |
| `step_scale(recipe)`                       | Scale variables in recipe                      |
| `workflow()`                               | Create workflow                                |

The functions below extend the above table for material in Week 8 (`classification2`) and beyond.

| Function                               | Description                                                                               |
| -------------------------------------- | ----------------------------------------------------------------------------------------- |
| `apparent(data)`                       | Sampling for the apparent error rate                                                      |
| `augment(fit, data)`                   | Add predictions/residuals/cluster assignments to dataframe                                |
| `collect_metrics(fitted_model)`        | Aggregate the mean and standard error of the model's accuracy across the folds            |
| `conf_mat(data, truth, estimate)`      | Computes and returns the confusion matrix                                                 |
| `fit_resamples(model, resamples)`      | Runs cross-validation on each train/validation split to build a fitted model              |
| `glance(fitted_model)`                 | Obtain total WSSD of a cluster model                                                      |
| `initial_split(data, prop, strata)`    | Splits the data                                                                           |
| `k_means(num_clusters)`                | Specify that the model is kmeans clustering                                               |
| `kmeans(data, centers, nstart)`        | Runs k-means clustering on the given data for the specified number of clusters and starts |
| `list(objects)`                        | Create a list of elements of different types                                              |
| `linear_reg()`                         | Specify that the model is linear regression                                               |
| `metrics(data, truth, estimate)`       | Returns the model's accuracy metrics                                                      |
| `testing(data)`                        | extract testing data                                                                      |
| `training(data)`                       | extract training data                                                                     |
| `tune()`                               | Tune neighbors                                                                            |
| `tune_cluster(model, resamples, grid)` | Run kmeans on multimple resamples of data                                                 |
| `tune_grid(model, resamples, grid)`    | Fit the model for each value in a range of parameter values                               |
| `unlist(list)`                         | Convert a list to a vector                                                                |
| `unnest(tbl, list_column)`             | Expand a column containing a list of tibbles into rows and columns                        |
| `vfold_cv(data, v, strata)`            | Perform cross validation                                                                  |

## Inference

| Function                                 | Description                                                                 |
| ---------------------------------------- | --------------------------------------------------------------------------- |
| `quantile(data, percentiles)`            | Finds the specified percentiles in the given data                           |
| `rep_sample_n(tbl, size, reps, replace)` | Takes samples of the table according to the size, reps, and replace options |
| `sample_n(tbl, num)`                     | Random selects the specified number of rows from the table                  |
