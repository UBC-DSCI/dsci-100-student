# DSCI 100 function reference sheet for Python

This reference sheet contains the key objects that we use in DSCI 100,
and a brief syntax example for each of the main packages.
During the closed book exams,
you will still have access to this page,
so get familiar with it already now.
There is no guarantee
that every function or parameter in the textbook is covered here,
but if you think there is something missing,
please let us know and we can consider adding it.

Note that we have only described use cases relevant to DSCI 100.
For example, the function reference for a pandas data frame is `pd.DataFrame(data_as_dict)`,
because in DSCI 100 we show you how to create data frames from a dictionary in this manner.
Although there are many other ways of creating data frames
and many parameters that you could use inside `pd.DataFrame`,
we have opted to only include what we use in DSCI 100
to make this guide more useful for you.
Sometimes we have included the exact parameter name of a function,
e.g. `drop(columns)`,
other times we have opted to included a more descriptive name,
e.g. `agg(list_of_aggregations)`.

## Data wrangling (`pandas`)

A typical data frame operation would look something like this:

```python
import pandas as pd

df.loc[
    df['column2'] < 10,
    ['column2', 'column3']
].mean()
```

`pandas` functions, prefix with `pd.`

| Name                        | Description                                                                   |
|-----------------------------|-------------------------------------------------------------------------------|
| DataFrame(data_as_dict)     | A two-dimensional, heterogeneous tabular data structure with labeled axes     |
| Series(data_as_list)        | A one-dimensional labeled array capable of holding data of various types      |
| crosstab(df)                | Compute a cross-tabulation of two (or more) factors, e.g. a confusion matrix. |
| concat(dfs_or_series)       | Concatenate pandas objects (dfs, series) along a particular axis              |
| read_csv(filepath, sep)     | Read data from a CSV file                                                     |
| read_excel(filepath, sheet) | Read data from an Excel file                                                  |
| read_html(filepath)         | Parse HTML tables from a web page and return a list of DataFrames             |
| to_csv(filepath, index)     | Write a DataFrame to a CSV file                                               |

Data frame methods, prefix with the name of the data frame (e.g. `df.`)

| Name                                | Description                                                                   |
|-------------------------------------|-------------------------------------------------------------------------------|
| abs()                               | Convert to absolute value                                                     |
| agg(list_of_aggregations)           | Perform multiple aggregations ('mean', 'median', etc)                         |
| apply(func)                         | Apply a function to every column or row in the df                             |
| assign(newcol=oldcol*2)             | Create a new column                                                           |
| astype(dtype)                       | Convert the data type of a column                                             |
| describe()                          | Calculate common descriptive statistics                                       |
| drop(columns)                       | Remove the specified row(s) or column(s)                                      |
| dropna()                            | Remove the rows that contains NULL/NA values                                  |
| groupby(column_as_str)              | Group rows together if share value in the specified column                    |
| contains(string)                    | For searching for a str within the values of a df column                      |
| isin(values)                        | For each value in a column, check if it is present in the specified values    |
| iloc[]                              | Select rows and columns by their integer positions                            |
| info()                              | Print a concise summary of a df                                               |
| loc[]                               | Filter rows and select columns at the same time                               |
| max()                               | Return the maximum value of the columns                                       |
| mean()                              | Return the mean value of the columns                                          |
| melt(id_vars, var_name, value_name) | Unpivot a df from wide to long format                                         |
| merge(df, on)                       | Merge data frames or series                                                   |
| min()                               | Return the minimum value of the columns                                       |
| nlargest()                          | Return top n rows after sorting the df by a column's highest value            |
| nsmallest()                         | Return top n rows after sorting the df by a column's smallest value           |
| pivot(index, columns, values)       | Turn df from long to wide                                                     |
| quantile()                          | Return the value at the specified quantile                                    |
| query()                             | Filter a data frame based on row condition query, similar to [].              |
| rename(columns)                     | Rename columns in a df                                                        |
| replace(to_replace, value)          | Replace specific values to desired new values                                 |
| reset_index()                       | Reset the index of the df to a numerical range                                |
| round()                             | Round values in a df                                                          |
| sample(n, frac, replace)            | Return a random sample of n rows from a df                                    |
| shape                               | Find the number of rows and cols of the df                                    |
| sort_values()                       | Order the rows of a df by the values of certain col                           |
| str.startswith()                    | Test if the start of each str element in a column matches a pattern           |
| sum()                               | Return the sum of the values over the requested axis                          |
| tail()                              | Return a specified number of rows from the end of the df                      |
| unique()                            | See all unique values in a column                                             |
| value_counts()                      | Return a Series containing the frequency of each distinct value in the column |


Data base methods, perform on a database connection or a table

| Name                                                      | Description                                                                |
|-----------------------------------------------------------|----------------------------------------------------------------------------|
| ibis.sqlite.connect(database, host, port, user, password) | Connect to a database                                                      |
| list_tables()                                             | List all tables in the database                                            |
| table()                                                   | Connect to a specific table in a database                                  |
| order_by()                                                | The same as `sort_values` for a data frame                                 |
| execute()                                                 | Execute a database table operation to yield a data frame from the database |

## Visualization (`altair`)

A typical chart syntax would look something like this:

```python
import altair as alt

alt.Chart(df).mark_point().encode(
    x='column1',
    y=alt.Y('column2').title('Column 2')
)
```

| Name                             | Description                                                                                                |
|----------------------------------|------------------------------------------------------------------------------------------------------------|
| Chart(df)                        | Specity the data used for the chart                                                                        |
| Color, X, Y, ...                 | Helpers for modifying the corresponding encoding, eg. adding a title                                       |
| axis(tickCount, format)          | Modify the axis format of a single axis                                                                    |
| configure_axis(titleFontSize)    | Modify the axis format of all axes                                                                         |
| mark_point(color, opacity, size) | Represent the data with the corresponding graphical mark                                                   |
| bin(maxbins)                     | Group the values of a column into bins (buckets)                                                           |
| 'count()', 'mean()', etc         | Special encoding strings to compute the count, mean, etc of a column                                       |
| datum(value)                     | A special encoding that creates data points directly instead of using a data frame                         |
| facet(column_as_str, columns)    | Create multiple views of a dataset where each panel contains a different subset                            |
| disable_max_rows()               | Disable the default maximum row limit for displaying data, which simplifies working with large data frames |
| encode(x, y, color, ...)         | Specify how data columns are encoded as visual channels (x, y, color, etc)                                 |
| & (ampersand)                    | Concatenating charts vertically                                                                            |
| \| (pipe)                        | Concatenating charts horizontally                                                                          |
| + (plus)                         | Layer multiple charts on top of each other                                                                 |
| legend(orient)                   | Modify the legend format and properties for the chart                                                      |
| properties(width, height)        | Set various properties and configurations for the chart                                                    |
| resolve_scale(x, y)              | Control if scales are shared or independent between charts                                                 |
| save('filename')                 | Save the chart to a file                                                                                   |
| scale(zero, type)                | Modify scale properties for encoding channels in the chart                                                 |
| stack()                          | Control if marks (e.g. bars of areas) should stack on top of each other                                    |
| title()                          | Add a title to the axis                                                                                    |

## Machine learning (`scikit-learn`)

Setting up a typical scikit-learn model would look something like this:

```python
knn = KNeighborsClassifier(n_neighbors=3)
knn.fit(X_train, y_train)
knn.score(X_test, y_test)
```

| Name                                                               | Description                                                                                                  |
|--------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|
| GridSearchCV(estimator, param_grid, cv)                            | Perform an exhaustive search over a hyperparameter grid to find the best combination using cross-validation. |
| KMeans(n_clusters)                                                 | Initialize a K-Means clustering algorithm for grouping data points into clusters based on similarity.        |
| KNeighborsClassifier(n_neighbors)                                  | Initialize a k-Nearest Neighbors classifier for classification tasks.                                        |
| KNeighborsRegressor(n_neighbors)                                   | Initialize a k-Nearest Neighbors regressor for regression tasks.                                             |
| LinearRegression()                                                 | Initialize a Linear regression model for predicting continuous target values from input features.            |
| SimpleImputer()                                                    | Initialize a Imputation transformer for handling missing data using simple strategies.                       |
| StandardScaler()                                                   | Initialize a Scaler for standardizing features by subtracting the mean and scaling to unit variance.         |
| best_params_                                                       | Attribute in GridSearchCV containing the best hyperparameters found during the grid search.                  |
| coef_                                                              | Attribute in linear models (e.g., LinearRegression) containing the estimated coefficients of features.       |
| cross_validate()                                                   | Function for evaluating a model's performance using cross-validation and returning multiple scores.          |
| cv_results_                                                        | Attribute in GridSearchCV containing detailed results from cross-validation grid search.                     |
| [1].labels_                                                        | Attribute for parsing out the assigned label for each observation in a KMeans cluster object.                |
| euclidean_distances(x, y)                                          | Compute pairwise Euclidean distances between points in two datasets.                                         |
| fit(X, y)                                                          | Fit/train the model                                                                                          |
| get_params()                                                       | Method to retrieve the hyperparameters of an estimator.                                                      |
| inertia_                                                           | Attribute in KMeans indicating the sum of squared distances from samples to their cluster centers.           |
| intercept_                                                         | Attribute in linear models (e.g., LinearRegression) containing the intercept term of the model.              |
| make_column_selector(dtype_include)                                | Function for creating a column selector for transformers in a ColumnTransformer.                             |
| make_column_transformer((transformer, list_of_columns), remainder) | Function for creating a composite transformer for feature preprocessing.                                     |
| make_pipeline(preprocessor, model)                                 | Function for creating a composite estimator (pipeline) with specified preprocessing and model steps.         |
| mean_squared_error()                                               | Function to calculate the mean squared error between true and predicted values for regression tasks.         |
| named_steps                                                        | Attribute in a Pipeline object providing access to individual steps by name.                                 |
| predict(X)                                                         | Method used to make predictions on new data samples for various estimators.                                  |
| score(X, y)                                                        | Method for calculating the accuracy or performance metric of a classifier or regressor.                      |
| set_config()                                                       | Function to configure global scikit-learn settings and behavior.                                             |
| train_test_split(df, train_size, stratify)                         | Function for splitting a dataset into training and testing sets for model evaluation.                        |


## Other

| Name                                 | Description                                                                                                             |
|--------------------------------------|-------------------------------------------------------------------------------------------------------------------------|
| [print(num**2) for num in range(10)] | A list comprehension to loop through the given range and perform an operation (here printing the square of the numbers) |
| append()                             | Add elements to the end of a list or array                                                                              |
| enumerate(iterable)                  | Generate indices and values from an iterable                                                                            |
| print()                              | Display text or variable values to the console                                                                          |
| range(start, stop, step)             | Create a range with regularly spaced values                                                                             |
| np.arange(start, stop, step)         | Create an array with regularly spaced values                                                                            |
| np.array(list)                       | Create a NumPy array from a list or other iterable                                                                      |
| np.seed(seed)                        | Seed the random number generator for reproducibility                                                                    |
| np.sqrt(x)                           | Calculate the square root of a numeric value or array                                                                   |
